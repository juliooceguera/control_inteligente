function [THETA] = fir_5(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1 1 1]';
THETA = zeros (1, 5)';
GAMA = zeros (1, 5);
P=zeros (5, 5);
P_ANT= eye (5);
error=0;

x1=0;
X2=0;
x3=0;
X4=0;
x5=0;

    for j = 5: DATOS.length
   
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    x4 = DATOS.Data(j-3,1);
    x5 = DATOS.Data(j-4,1);
    
    regresores = [x1 x2 x3 x4 x5]';
    
    THETA=THETA_ANT + GAMA*error;
    error=DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(5)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;
    
    end
    
x1=0;
X2=0;
x3=0;
X4=0;
x5=0;
Yest=zeros(DATOS.length,1);

    for j = 5: DATOS.length
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    x4 = DATOS.Data(j-3,1);
    x5 = DATOS.Data(j-4,1);
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3+THETA(4,1)*x4+THETA(5,1)*x5;
    end
    
plot(tiempo,Yest, 'Color','[0 1 1]')
hold on; 
