function [] = modifybtn(icol, irow)
%modify modfo.btn
%modfobtn.m
delete 'modfo.btn';
filein= 'modfo_as.btn';
fileout= 'modfo.btn';
fidin=fopen(filein,'r');
fidout=fopen(fileout,'a+');
for i=1:7
    datacopy(filein,fileout,i);
end

for i=1:80
    fprintf(fidout,'%10.6f',icol(i));
end
fprintf(fidout,'%10.6f\r\n',icol(81));

for i=9
    datacopy(filein,fileout,i);
end

for i=1:40
    fprintf(fidout,'%10.6f',irow(i));
end
fprintf(fidout,'%10.6f\r\n',irow(41));

for i=11:51
    datacopy(filein,fileout,i);
end

% fclose(fidin);
% fclose(fidout);
fclose('all');

end