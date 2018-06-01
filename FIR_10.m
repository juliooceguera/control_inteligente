function [THETA] = fir_10(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1 1 1 1 1 1 1 1]';
THETA = zeros (1, 10)';
GAMA = zeros (1, 10);
P=zeros (10, 10);
P_ANT= eye (10);
error=0;

x1=0;
X2=0;
x3=0;
X4=0;
x5=0;
x6=0;
X7=0;
x8=0;
X9=0;
x10=0;

    for j = 10: DATOS.length
   
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    x4 = DATOS.Data(j-3,1);
    x5 = DATOS.Data(j-4,1);
    x6 = DATOS.Data(j-5,1);
    x7 = DATOS.Data(j-6,1);
    x8 = DATOS.Data(j-7,1);
    x9 = DATOS.Data(j-8,1);
    x10 = DATOS.Data(j-9,1);

    regresores = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10]';
    
    THETA=THETA_ANT + GAMA*error;
    error=DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(10)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;
    
    end
    
x1=0;
X2=0;
x3=0;
X4=0;
x5=0;
x6=0;
X7=0;
x8=0;
X9=0;
x10=0;

Yest=zeros(DATOS.length,1);

    for j = 10: DATOS.length

    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    x4 = DATOS.Data(j-3,1);
    x5 = DATOS.Data(j-4,1);
    x6 = DATOS.Data(j-5,1);
    x7 = DATOS.Data(j-6,1);
    x8 = DATOS.Data(j-7,1);
    x9 = DATOS.Data(j-8,1);
    x10 = DATOS.Data(j-9,1);
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3+THETA(4,1)*x4+THETA(5,1)*x5+THETA(6,1)*x6+THETA(7,1)*x7+THETA(8,1)*x8+THETA(9,1)*x9+THETA(10,1)*x10;
    end
    
plot(tiempo,Yest, 'Color','[0.7 0.7 0.1]')
hold on; 
