ptf #
3D TRANSPORT IN UNIFORM FLOW FIELD WITH CONTINUOUS POINT SOURCE                 
(REFER TO SECTION 7.7 OF MT3DMS MANUAL)                                         
         1       41        81         14         1         1  !NLAY,NROW,NCOL,NP
 DAY  FT  LB                                                  !TUNIT,LUNIT,MUNIT
 T T T F T F F F F F                            !TRNOP: ADV,DSP,SSM,RCT,GCG...  
 0                                                                              
       100         0(81f10.6)                 3   ! DELR                        
#  dx1#   #  dx2#   #  dx3#   #  dx4#   #  dx5#   #  dx6#   #  dx7#   #  dx8#   #  dx9#   # dx10#   # dx11#   # dx12#   # dx13#   # dx14#   # dx15#   # dx16#   # dx17#   # dx18#   # dx19#   # dx20#   # dx21#   # dx22#   # dx23#   # dx24#   # dx25#   # dx26#   # dx27#   # dx28#   # dx29#   # dx30#   # dx31#   # dx32#   # dx33#   # dx34#   # dx35#   # dx36#   # dx37#   # dx38#   # dx39#   # dx40#   # dx41#   # dx42#   # dx43#   # dx44#   # dx45#   # dx46#   # dx47#   # dx48#   # dx49#   # dx50#   # dx51#   # dx52#   # dx53#   # dx54#   # dx55#   # dx56#   # dx57#   # dx58#   # dx59#   # dx60#   # dx61#   # dx62#   # dx63#   # dx64#   # dx65#   # dx66#   # dx67#   # dx68#   # dx69#   # dx70#   # dx71#   # dx72#   # dx73#   # dx74#   # dx75#   # dx76#   # dx77#   # dx78#   # dx79#   # dx80#   # dx81#
       100         0(41f10.6)                 3   ! DELC                        
#  dy1#   #  dy2#   #  dy3#   #  dy4#   #  dy5#   #  dy6#   #  dy7#   #  dy8#   #  dy9#   # dy10#   # dy11#   # dy12#   # dy13#   # dy14#   # dy15#   # dy16#   # dy17#   # dy18#   # dy19#   # dy20#   # dy21#   # dy22#   # dy23#   # dy24#   # dy25#   # dy26#   # dy27#   # dy28#   # dy29#   # dy30#   # dy31#   # dy32#   # dy33#   # dy34#   # dy35#   # dy36#   # dy37#   # dy38#   # dy39#   # dy40#   # dy41#
         0       1.                                           !HTOP             
         0       1.                                          !DZ-LAYER 1        
        50         1(81F10.4)                   5            !PRSITY-LAYER 1    
         0         1                                          !ICBUND-LAYER 1   
        30         1(81F10.4)                   5            !SCONC-LAYER 1     
   -111.11         0                                          !CINACT,THKMIN    
         1         2         0         0         T         T  !OUTPUT CONTROL   
        14                                                    !NPRS             
        1.        2.        3.        4.        5.        6.        7.        8.
        9.       10.       11.       12.       13.       14.
         1         1                                          !NOBS,NPROBS      
         1         1         61           ow1                                   
         T         1                                          !CHKMAS,NPRMAS    
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
  1.000000         1        2.
        0.     10000        2.       3.5                      !DT0,MXSTRN,TTSMUL
