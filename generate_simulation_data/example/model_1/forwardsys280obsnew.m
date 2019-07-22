function  [obs]=forwardsys280obsnew(cond,source)

nrow = 41;
ncol = 81;

% %% ��������,�޸�modfo.dis modfo.btn
sx = source(1);
sy = source(2);
[dx1,dx2,nx] = getint(20,0.25,sx);    % (xx,yy) is the location of the contaminant source
icol=zeros(81,1);
icol(1:nx)=dx1;
icol(nx+1:end)=dx2;

[dy1,dy2,ny] = getint(10,0.25,sy);    
irow=zeros(41,1);
irow(1:ny)=dy1;
irow(ny+1:end)=dy2;

sc = zeros(1,14);
% sc(1:10) = source(3:end);
j = 3;
for i = 1 : 2 : 10
    sc(i:i+1) = source(j);
    j = j + 1;
end

icolrow = [icol; irow];
save para.in icolrow -ascii
[~,~] = unix('../driver1.exe');  % Unix
% modifydis(icol, irow);
% modifybtn(icol, irow);
modifyssm(nx, ny, sc);

% ������ɢ��
% AL = 1.0*ones(nrow,ncol);
% dlmwrite('Disp_001.dat',AL,'delimiter', '', 'precision', '%10.4f','newline', 'pc');

% poro = x(3)*ones(nrow,ncol);
% dlmwrite('Poro_001.dat',poro,'delimiter', '', 'precision', '%10.4f','newline', 'pc');

%% ���浼ˮ�ʲ���
dlmwrite('Cond.dat',cond,'delimiter', '', 'precision', '%12.4e','newline', 'pc');

%% ����    
% delete MT3D001.UCN conc* heads.dat
% [~,outp] = system('MT3DMS.bat');    % Windows
%[~,outp] = unix('./runMT3D.sh');  % Unix
[~,~] = unix('../mf2k modfo.nam');  % Unix
[~,~] = unix('../mt3d.exe');  % Unix

xobs = [5.7,10.0,14.8,5.8,12.5,17.5, 6.1, 10.0, 18.2, 12.8 10.8, 12.2, 7.2, 8.8, 18.0, 6.8, 8.0, 8.4, 14.5,16.0,10.5]; 
yobs = [3.8,2.4, 3.6, 4.9, 5.0, 3.4, 6.3,  7.1,  4.5,  2.9, 3.9,  6.9, 5.5, 5.9,  6.1, 4.3, 2.2, 4.0, 5.5, 7.0, 5.5];
Nwell = size(xobs,2);

obs = zeros(7,Nwell);
[~,~] = unix('../pm.exe<PMin.txt');
xyConc = load('conc2.dat');
% [fid,~] = fopen('conc2.dat','rt');
% xyConc = (fscanf(fid,'%f',[4,3321]))';
% fclose(fid);
x = (reshape(xyConc(:,1),ncol,nrow));
x = x';
y = reshape(xyConc(:,2),ncol,nrow);
y = y';
conc = reshape(xyConc(:,end),ncol,nrow);
conc = conc';
obs(1, :) = interp2(x,y,conc,xobs,yobs,'linear');

% f = figure('visible','off');
% subplot(2,4,1),
% contourf(x,y,flipud(conc),30,'linestyle','none'),colorbar
% colormap(jet)
% pbaspect([2 1 1])
% hold on,
% scatter(xobs, yobs,10,'ow','filled')
% hold on,

for t = 2 : 7
%     modifypm(2*t);
    % [~,outp] = system('PMrun.bat'); % Windows
    % [~,outp] = unix('./pm.sh');       % Unix
    % [~,outp] = unix('./pm.exe<PMin.txt');       % Unix
%     [~,~] = unix(['./pm.exe<PMin',num2str(2*t),'.txt']);
%     !./pm.exe<PMin.txt>out.txt       % Unix
    xyConc = load(['conc',num2str(2*t),'.dat']);
%     [fid,~] = fopen(['conc',num2str(2*t),'.dat'],'rt');
%     xyConc = (fscanf(fid,'%f',[4,3321]))';
%     fclose(fid);
    
    conc = reshape(xyConc(:,end),ncol,nrow);
    conc = conc';
%     dlmwrite(['conc_',num2str(1),'_t_',num2str(t),'.dat'],conc,'delimiter', '', 'precision', '%11.3e','newline', 'pc');
    
%     subplot(2,4,t),
%     contourf(x,y,flipud(conc),30,'linestyle','none'),colorbar
%     colormap(jet)
%     pbaspect([2 1 1])
%     hold on,
%     scatter(xobs, yobs,10,'ow','filled')
%     hold on,
    
    obs(t, :) = interp2(x,y,conc,xobs,yobs,'linear');

end

% set(f, 'PaperUnits', 'inches');
% x_width=20;y_width=5;
% set(f, 'PaperPosition', [0 0 x_width y_width]); 
% set(gca,'LooseInset',get(gca,'TightInset'))
% saveas(f,'true_conc','png')
% % saveas(f,'est_conc','png')

head = load('heads.dat');
% [fid,~] = fopen('heads.dat','rt');
% head = (fscanf(fid,'%f',[1,3321]))';
% fclose(fid);
head = reshape(head,ncol,nrow);
head = head';
% dlmwrite(['head_',num2str(1),'.dat'],head,'delimiter', '', 'precision', '%11.3e','newline', 'pc');
obsi = interp2(x,y,head,xobs,yobs,'linear');
obs = [obs; obsi];
obs = reshape(obs',Nwell*8,1);

% f = figure('visible','off');
% contourf(x,y,head,30,'linestyle','none'),colorbar
% colormap(jet)
% pbaspect([2 1 1])
% hold on,
% scatter(xobs, yobs,'ow','filled')
% set(f, 'PaperUnits', 'inches');
% x_width=10;y_width=5;
% set(f, 'PaperPosition', [0 0 x_width y_width]); 
% set(gca,'LooseInset',get(gca,'TightInset'))
% saveas(f,'head','png')
% toc;

delete para.in modfo.btn modfo.dis MT3D001.UCN conc* heads.dat Cond.dat modfo.ftl modfo.m3d modfo.lst MT3D.CNF MT3D001.MAS MT3D001.OBS 

end

