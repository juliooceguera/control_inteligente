function [A, B, C, SIGMA]= BACKPROPAGATION(DATOS, LR)

A1 = [1,1;1,1];
A2 = [1,1;1,1];
A3 = [1,1;1,1];
B1 = [1;1];
B2 = [1;1];
B3 = [1;1];
C11 = 1;
C21 = 1;
C31 = 1;
C12 = 1;
C22 = 1;
C32 = 1;

SIGMA11 = 1;
SIGMA21 = 1;
SIGMA31 = 1;
SIGMA12 = 1;
SIGMA22 = 1;
SIGMA32 = 1;
Xest = [1;1];


deriv_parcial_A1 = [1,1;1,1];
deriv_parcial_A2 = [1,1;1,1];
deriv_parcial_A3 = [1,1;1,1];

deriv_parcial_B1 = [1;1];
deriv_parcial_B2 = [1;1];
deriv_parcial_B3 = [1;1];

deriv_parcial_C11 = 1;
deriv_parcial_C21 = 1;
deriv_parcial_C31 = 1;
deriv_parcial_C12 = 1;
deriv_parcial_C22 = 1;
deriv_parcial_C32 = 1;

deriv_parcial_SIGMA11 = 1;
deriv_parcial_SIGMA21 = 1;
deriv_parcial_SIGMA31 = 1;
deriv_parcial_SIGMA12 = 1;
deriv_parcial_SIGMA22 = 1;
deriv_parcial_SIGMA32 = 1;

for D=2:DATOS.length
    
deriv_parcial_A1 = (exp(-((X1- C11)/(SIGMA11))^2)* exp(-((X2 - C12)/(SIGMA12))^2)  *  X) /  ;   
deriv_parcial_A2 = 
deriv_parcial_A3 = 

deriv_parcial_B1 = 
deriv_parcial_B2 = [1;1];
deriv_parcial_B3 = [1;1];

deriv_parcial_C11 = 1;
deriv_parcial_C21 = 1;
deriv_parcial_C31 = 1;
deriv_parcial_C12 = 1;
deriv_parcial_C22 = 1;
deriv_parcial_C32 = 1;

deriv_parcial_SIGMA11 = 1;
deriv_parcial_SIGMA21 = 1;
deriv_parcial_SIGMA31 = 1;
deriv_parcial_SIGMA12 = 1;
deriv_parcial_SIGMA22 = 1;
deriv_parcial_SIGMA32 = 1;
    
    
    
    
    Ci1 =  Ci1 - LR * deriv_parcial_C;
    SIGMA =  SIGMA - LR * deriv_parcial_SIGMA;
    B =  B - LR * deriv_parcial_B;
    A =  A - LR * deriv_parcial_A;
      
    numerador =  exp(-((X1- C11)/(SIGMA11))^2)* exp(-((X2 - C12)/(SIGMA12))^2)  * (A1 * X + B1 * U) + exp(-((X1- C21)/(SIGMA21))^2)* exp(-((X2 - C22)/(SIGMA22))^2)  * (A2 * X + B2 * U) + exp(-((X1- C31)/(SIGMA31))^2)* exp(-((X2 - C32)/(SIGMA32))^2)  * (A3 * X + B3 * U); 
    denominador = exp(-((X1- C11)/(SIGMA11))^2)* exp(-((X2 - C12)/(SIGMA12))^2) + exp(-((X1- C21)/(SIGMA21))^2)* exp(-((X2 - C22)/(SIGMA22))^2) + exp(-((X1- C31)/(SIGMA31))^2) * exp(-((X2 - C32)/(SIGMA32))^2);
    Xest = numerador /  denominador;
    
end
















