function [THETA] = fir_3(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1]';
THETA = zeros (1, 3)';
GAMA = zeros (1, 3);
P=zeros (3, 3);
P_ANT= eye (3);
error=0;

x1=0;
X2=0;
x3=0;

    for j = 3: DATOS.length
   
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x2 = DATOS.Data(j-2,1);
    
    regresores = [x1 x2 x3]';
    
    THETA=THETA_ANT + GAMA*error;
    error=DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(3)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;

    
    end
    
x1=0;
X2=0;
x3=0;
Yest=zeros(DATOS.length,1);

    for j = 3: DATOS.length
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3;
    end
    
plot(tiempo,Yest, 'Color','[0 0 1]')
hold on; 
