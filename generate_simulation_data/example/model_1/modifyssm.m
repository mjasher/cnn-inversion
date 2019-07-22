function [] = modifyssm(nx, ny, sc)
%modify modfo.ssm
%modfossm.m
delete 'modfo.ssm';
filein = 'modfo_tpl.ssm';
fileout = 'modfo.ssm';
fidin = fopen(filein,'r');
fidout = fopen(fileout,'a+');
for i = 1 : 3
    datacopy(filein,fileout,i);
end

k = 1;
for i = 4 : 31
    if mod(i,2) == 0
        fprintf(fidout,'%10d%10d%10d%10.6f%10d\r\n',1,ny,nx,sc(k),15);
        k = k + 1;        
    else
        datacopy(filein,fileout,i);
    end
end

% fclose(fidin);
% fclose(fidout);
fclose('all');

end