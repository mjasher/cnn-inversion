mosize = 1681*3;obsnum = 34;
hh = zeros(mosize,obsnum);

obspos = [ 5,5 ;
 5,21;
 5,37 ;
 21,5 ;
 21,21 ;
 37,37;
 37,5 ;
 37,21 ;
 37,37 ;
 9,9;
 9,17 ;
 9,25;
 9,33 ;
 17,9 ;
 17,17 ;
 17,25 ;
 17,33;
 25,9 ;
 25,17;
 25,25 ;
 25,33 ;
 33,9 ;
 33,17 ;
 33,25 ;
 33,33;];

%get C obs
for j = 1:25;
    hh(abc(obspos(j,1),obspos(j,2)),j) = 1;
    hh(abc(obspos(j,1),obspos(j,2))+mosize/3,j+25) = 1;
end;



%get H obs




hh = hh';
hhv(1:25,:)=hh(26:50,:);
hhv(26:50,:)=hh(1:25,:);