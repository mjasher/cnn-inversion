function [] = modifypm(t)
% modify PMin.txt
% modifypm.m

delete 'PMin.txt';
filein = 'PMin_tpl.txt';
fileout = 'PMin.txt';
fidin = fopen(filein,'r');
fidout = fopen(fileout,'a+');
for i = 1 : 4
    datacopy(filein,fileout,i);
end

for i = 5 
    fprintf(fidout,'%-5d\r\n',t);
end

for i = 6 : 11
    datacopy(filein,fileout,i);
end

% fclose(fidin);
% fclose(fidout);
fclose('all');

end