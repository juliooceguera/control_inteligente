function [THETA] = iir_3(DATOS,lambda,tiempo)
THETA_ANT = [1 1 1 1 1 1]';
THETA = zeros (1, 6)';
GAMA = zeros (1, 6);
P=zeros (6, 6);
P_ANT= eye (6);
error=0;

x1=0;
X2=0;
x3=0;
y1=0;
y2=0;
y3=0;

    for j = 4: DATOS.length
   
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x2 = DATOS.Data(j-3,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    
    regresores = [x1 x2 x3 y1 y2 y3]';
    
    THETA=THETA_ANT + GAMA*error;
    error=DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(6)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;
    
    end
    
x1=0;
X2=0;
x3=0;
y1=0;
y2=0;
y3=0;

Yest=zeros(DATOS.length,1);

    for j = 4: DATOS.length
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x3 = DATOS.Data(j-3,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3+THETA(4,1)*y1+THETA(5,1)*y2+THETA(6,1)*y3;
    end
     
plot(tiempo,Yest, 'Color','[0 0 0]')
hold on