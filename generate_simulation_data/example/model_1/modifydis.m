function [] = modifydis(icol, irow)
%modify modfo.dis
%modfodis.m
delete 'modfo.dis';
filein='MODFO_as.DIS'; %���������ʷ���Ϣ
fileout='modfo.dis';
fidin=fopen(filein,'r');
fidout=fopen(fileout,'a+');
for i=1:3
    datacopy(filein,fileout,i);
end

for i=1:8
    for j=1:9
        fprintf(fidout,'%10.6f',icol(i*10+j-10));
    end
    fprintf(fidout,'%10.6f\r\n',icol(i*10));
end
fprintf(fidout,'%10.6f\r\n',icol(81));


for i=13
    datacopy(filein,fileout,i);
end

for i=1:4
    for j=1:9
        fprintf(fidout,'%10.6f',irow(i*10+j-10));
    end
    fprintf(fidout,'%10.6f\r\n',irow(i*10));
end
fprintf(fidout,'%10.6f\r\n',irow(41));


for i=19:21
    datacopy(filein,fileout,i);
end

% fclose(fidin);
% fclose(fidout);
fclose('all');

end