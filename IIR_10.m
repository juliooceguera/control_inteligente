function [THETA] = iir_10(DATOS,lambda)
THETA_ANT = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]';
THETA = zeros (1, 20)';
GAMA = zeros (1, 20);
P=zeros (20, 20);
P_ANT= eye (20);
error=0;

x1=0;
X2=0;
x3=0;
x4=0;
X5=0;
x6=0;
X7=0;
x8=0;
x9=0;
X10=0;
y1=0;
y2=0;
y3=0;
y4=0;
y5=0;
y6=0;
y7=0;
y8=0;
y9=0;
y10=0;
    for j = 11: DATOS.length/50
   
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x3 = DATOS.Data(j-3,1);
    x4 = DATOS.Data(j-4,1);
    x5 = DATOS.Data(j-5,1);
    x6 = DATOS.Data(j-6,1); 
    x7 = DATOS.Data(j-7,1);
    x8 = DATOS.Data(j-8,1);
    x9 = DATOS.Data(j-9,1);
    x10 = DATOS.Data(j-10,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    y4=DATOS.Data(j-4,2);
    y5=DATOS.Data(j-5,2);
    y6=DATOS.Data(j-6,2);
    y7=DATOS.Data(j-7,2);
    y8=DATOS.Data(j-8,2);
    y9=DATOS.Data(j-9,2);
    y10=DATOS.Data(j-10,2); 
    regresores = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10]';
    
    THETA=THETA_ANT + GAMA*error;
    error=DATOS.Data(j,2)-regresores'*THETA_ANT;
    GAMA=(1/(regresores'*P_ANT*regresores+lambda))*P_ANT*regresores;
    P=(1/lambda)*(eye(20)-GAMA*regresores')*P_ANT;
      
    THETA_ANT=THETA;
    P_ANT=P;
    
    end
    
x1=0;
X2=0;
x3=0;
x4=0;
X5=0;
x6=0;
X7=0;
x8=0;
x9=0;
X10=0;
y1=0;
y2=0;
y3=0;
y4=0;
y5=0;
y6=0;
y7=0;
y8=0;
y9=0;
y10=0;

Yest=zeros(DATOS.length,1);

    for j = 11: DATOS.length
    x1 = DATOS.Data(j-1,1); 
    x2 = DATOS.Data(j-2,1);
    x3 = DATOS.Data(j-3,1);
    x4 = DATOS.Data(j-4,1);
    x5 = DATOS.Data(j-5,1);
    x6 = DATOS.Data(j-6,1); 
    x7 = DATOS.Data(j-7,1);
    x8 = DATOS.Data(j-8,1);
    x9 = DATOS.Data(j-9,1);
    x10 = DATOS.Data(j-10,1);
    y1=DATOS.Data(j-1,2);
    y2=DATOS.Data(j-2,2);
    y3=DATOS.Data(j-3,2);
    y4=DATOS.Data(j-4,2);
    y5=DATOS.Data(j-5,2);
    y6=DATOS.Data(j-6,2);
    y7=DATOS.Data(j-7,2);
    y8=DATOS.Data(j-8,2);
    y9=DATOS.Data(j-9,2);
    y10=DATOS.Data(j-10,2);  
    
    Yest(j)=THETA(1,1)*x1+THETA(2,1)*x2+THETA(3,1)*x3+THETA(4,1)*x4+THETA(5,1)*x5+THETA(6,1)*x6+THETA(7,1)*x7+THETA(8,1)*x8+THETA(9,1)*x9+THETA(10,1)*x10+THETA(11,1)*y1+THETA(12,1)*y2+THETA(13,1)*y3+THETA(14,1)*y4+THETA(15,1)*y5+THETA(16,1)*y6+THETA(17,1)*y7+THETA(18,1)*y8+THETA(19,1)*y9+THETA(20,1)*y10;
    end
     
plot(tiempo,Yest, 'Color','[0.7 0.2 0.7]')
legend('Entrada','Salida','Polinomio_3','FIR_3','IIR_3','Polinomio_5','FIR_5','IIR_5','Polinomio_10','FIR_10','IIR_10');