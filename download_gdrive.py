import pickle
import io
import os
import logging

from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage
from apiclient.http import MediaFileUpload, MediaIoBaseDownload
from apiclient import errors
from apiclient import http

from apiclient import discovery

"""
pip3 install --upgrade google-api-python-client oauth2client google_auth_oauthlib

thanks https://gist.github.com/revolunet/9507070
thanks https://stackoverflow.com/questions/39003409/how-to-download-specific-google-drive-folder-using-python
"""

folder_id = '1CnITMyMOTmuSHQp8p5G9Vju3SFzi-9ae'

# json from https://console.cloud.google.com/apis/credentials
CREDS_FILE = os.getenv('CREDS_FILE')
# cached auth token
TOKEN_FILE = os.getenv('TOKEN_FILE')

SCOPES = ['https://www.googleapis.com/auth/drive']


def login():
    creds = None
    # The file token.pickle stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    if os.path.exists(TOKEN_FILE):
        with open(TOKEN_FILE, 'rb') as token:
            creds = pickle.load(token)
    # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(CREDS_FILE, SCOPES)
            creds = flow.run_local_server()
        # Save the credentials for the next run
        with open(TOKEN_FILE, 'wb') as token:
            pickle.dump(creds, token)
    return creds


def download_file(service, dowid, name, dfilespath):
    request = service.files().get_media(fileId=dowid)
    fh = io.BytesIO()
    downloader = MediaIoBaseDownload(fh, request)
    done = False
    while done is False:
        status, done = downloader.next_chunk()
        print("Download %d%%." % int(status.progress() * 100))
    with io.open(dfilespath + "/" + name, 'wb') as f:
        fh.seek(0)
        f.write(fh.read())


def download_folder(service, folder_id, des):
    results = service.files().list(
        q="\'" + folder_id + "\'" + " in parents",
        ).execute()
    for item in results['items']:
        download_file(service, item['id'], item['title'], des)
        print(item['title'])
    return results



credentials = login()
drive_service = build('drive', 'v2', credentials=credentials)

destination = folder_id
os.makedirs(destination)
download_folder(drive_service, folder_id, destination)

