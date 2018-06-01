function [THETA] = polinomio_5(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1 1 1]';
THETA = zeros (1, 5)';
GAMA = zeros (1, 5);
P=zeros (5, 5);
P_ANT= eye (5);
error=0;
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
    for j = 1: DATOS.length
   
    x1 = DATOS.Data(j,1); 
    x2 = (DATOS.Data(j,1))^2;
    x3 = (DATOS.Data(j,1))^3; 
    x4 = (DATOS.Data(j,1))^4;
    regresores = [1 x1 x2 x3 x4]';
    
    THETA=THETA_ANT + GAMA*error;
    error = DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(5)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;
    end
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
Yest=zeros(DATOS.length,1);

    for j = 1: DATOS.length
    x1 = DATOS.Data(j,1); 
    x2 = (DATOS.Data(j,1))^2;
    x3 = (DATOS.Data(j,1))^3; 
    x4 = (DATOS.Data(j,1))^4;
       
    Yest(j)=THETA(1,1)+THETA(2,1)*x1+THETA(3,1)*x2+THETA(4,1)*x3+THETA(5,1)*x4;
    end

plot(tiempo,Yest, 'Color','[1 1 0]')
hold on  



