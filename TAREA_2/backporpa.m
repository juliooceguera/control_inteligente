function [A, B, C, SIGMA]= BACKPROPAGATION(DATOS, LR, NUMERO_F)
 
 Am =zeros[NUMERO_F*2,2];
 BM = zeros[NUMERO_F, 2];
 Cm = zeros[NUMERO_F, 1];
 SIGMAm = zeros[NUMERO_F,1];

 
for D=2:DATOS.length