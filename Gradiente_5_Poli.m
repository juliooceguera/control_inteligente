function [THETA] = gradiente_5_poli(DATOS)
heta = 0.001;
D_theta_paso = 0.001;
g_ant = [1 1 1 1 1]';
Hessiano_ant = eye(5);
theta_ant = [1 1 1 1 1]';
D_g_ant = [1 1 1 1 1]';
Div_Num_Datos=100;
for i=1:DATOS.length/Div_Num_Datos
    i
    theta = theta_ant - heta*Hessiano_ant*g_ant;
    I_theta=0;
    I_theta_1=0;
    I_theta_2=0;
    I_theta_3=0;
    I_theta_4=0;
    I_theta_5=0;
    for w=1:i
    x1 = DATOS.Data(w,1); 
    x2 = (DATOS.Data(w,1))^2;
    x3 = (DATOS.Data(w,1))^3;
    x4 = (DATOS.Data(w,1))^4;
    regresores = [1 x1 x2 x3 x4]';
    y_est = regresores' * theta;
    error = DATOS.Data(w,2) - y_est;
    I_theta= I_theta+(error^2)/2;
    e_1=DATOS.Data(w,2)- regresores'*[theta(1,1)+D_theta_paso, theta(2,1), theta(3,1),theta(4,1),theta(5,1)]';
    e_2=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1)+D_theta_paso, theta(3,1),theta(4,1),theta(5,1)]';
    e_3=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1)+D_theta_paso,theta(4,1),theta(5,1)]';
    e_4=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1),theta(4,1)+D_theta_paso,theta(5,1)]';
    e_5=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1),theta(4,1),theta(5,1)+D_theta_paso]';
    I_theta_1= I_theta_1 + (e_1^2)/2;
    I_theta_2= I_theta_2 + (e_2^2)/2;
    I_theta_3= I_theta_3 + (e_3^2)/2;
    I_theta_4= I_theta_2 + (e_4^2)/2;
    I_theta_5= I_theta_3 + (e_5^2)/2;
    end
    g = [((I_theta_1-I_theta)/D_theta_paso),((I_theta_2-I_theta)/D_theta_paso),(I_theta_3-I_theta)/D_theta_paso,(I_theta_4-I_theta)/D_theta_paso,(I_theta_5-I_theta)/D_theta_paso]';
    D_theta_ant = theta - theta_ant;
    D_g_ant = g - g_ant;
    OP1 = D_theta_ant * D_g_ant';
    OP2=(D_theta_ant'*D_g_ant);
    OP=OP1/OP2;
    Hessiano= (eye(5)-OP)*Hessiano_ant*(eye(5)-OP)' + OP;
    g_ant=g;
    Hessiano_ant=Hessiano;
    theta_ant=theta;
    
end


Yest=zeros(round(DATOS.length,0),1);
Ent=zeros(round(DATOS.length,0),1);
Y=zeros(round(DATOS.length,0),1);
Tiempo=zeros(round(DATOS.length,0),1);

    for j = 1: DATOS.length
    x1 = DATOS.Data(j,1); 
    x2 = (DATOS.Data(j,1))^2;
    x3 = (DATOS.Data(j,1))^3;
    x4 = (DATOS.Data(j,1))^4;
    regresores = [1 x1 x2 x3 x4]';
    
    Tiempo(j)=DATOS.Time(j);
    Yest(j)=regresores' * theta;
    Ent(j)=DATOS.Data(j,1);
    Y(j)=DATOS.Data(j,2);
 
    end
plot(Tiempo,Ent, 'Color','[1 0 0]')
hold on;
plot(Tiempo,Y, 'Color','[0 1 0]')
hold on;    
plot(Tiempo,Yest, 'Color','[0 0 1]')
hold on; 
