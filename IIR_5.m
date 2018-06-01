function [THETA] = iir_5(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1 1 1 1 1 1 1 1]';
THETA = zeros (1, 10)';
GAMA = zeros (1, 10);
P=zeros (10, 10);
P_ANT= eye (10);
error=0;

x1=0;
X2=0;
x3=0;
x4=0;
X5=0;
y1=0;
y2=0;
y3=0;
y4=0;
y5=0;

    for j = 6: DATOS.length
   
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x3 = DATOS.Data(j-3,1);
    x4 = DATOS.Data(j-4,1);
    x5 = DATOS.Data(j-5,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    y4=DATOS.Data(j-4,2);
    y5=DATOS.Data(j-5,2);    
    regresores = [x1 x2 x3 x4 x5 y1 y2 y3 y4 y5]';
    
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
x4=0;
X5=0;
y1=0;
y2=0;
y3=0;
y4=0;
y5=0;

Yest=zeros(DATOS.length,1);

    for j = 6: DATOS.length
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x3 = DATOS.Data(j-3,1);
    x4 = DATOS.Data(j-4,1);
    x5 = DATOS.Data(j-5,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    y4=DATOS.Data(j-4,2);
    y5=DATOS.Data(j-5,2); 
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3+THETA(4,1)*x4+THETA(5,1)*x5+THETA(6,1)*y1+THETA(7,1)*y2+THETA(8,1)*y3+THETA(9,1)*y4+THETA(10,1)*y5;
    end
     
plot(tiempo,Yest, 'Color','[0.8 0.6 0.5]')
hold on