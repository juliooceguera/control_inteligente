function [THETA] = gradiente_3_fir(DATOS)
heta = 0.001;
D_theta_paso = 0.001;
g_ant = [1 1 1]';
Hessiano_ant = eye(3);
theta_ant = [1 1 1]';
D_g_ant = [1 1 1]';
Div_Num_Datos=45;
for i=3:round(DATOS.length/Div_Num_Datos,0)
    i
    theta = theta_ant - heta*Hessiano_ant*g_ant;
    I_theta=0;
    I_theta_1=0;
    I_theta_2=0;
    I_theta_3=0;
    for w=3:i
    x1 = DATOS.Data(w,1); 
    x2 = DATOS.Data(w-1,1);
    x3 = DATOS.Data(w-2,1);
    regresores = [x1 x2 x3]';
    y_est = regresores' * theta;
    error = DATOS.Data(w,2) - y_est;
    I_theta= I_theta+(error^2)/2;
    e_1=DATOS.Data(w,2)- regresores'*[theta(1,1)+D_theta_paso, theta(2,1), theta(3,1)]';
    e_2=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1)+D_theta_paso, theta(3,1)]';
    e_3=DATOS.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1)+D_theta_paso]';
    I_theta_1= I_theta_1 + (e_1^2)/2;
    I_theta_2= I_theta_2 + (e_2^2)/2;
    I_theta_3= I_theta_3 + (e_3^2)/2;
    end
    g = [((I_theta_1-I_theta)/D_theta_paso),((I_theta_2-I_theta)/D_theta_paso),(I_theta_3-I_theta)/D_theta_paso]';
    D_theta_ant = theta - theta_ant;
    D_g_ant = g - g_ant;
    OP1 = D_theta_ant * D_g_ant';
    OP2=(D_theta_ant'*D_g_ant);
    OP=OP1/OP2;
    Hessiano= (eye(3)-OP)*Hessiano_ant*(eye(3)-OP)' + OP;
    g_ant=g;
    Hessiano_ant=Hessiano;
    theta_ant=theta;
    
end


Yest=zeros(round(DATOS.length,0)-2,1);
Ent=zeros(round(DATOS.length,0)-2,1);
Y=zeros(round(DATOS.length,0)-2,1);
Tiempo=zeros(round(DATOS.length,0)-2,1);

    for j = 3: round(DATOS.length,0)
    x1 = DATOS.Data(j,1); 
    x2 = DATOS.Data(j-1,1);
    x3 = DATOS.Data(j-2,1);
    regresores = [x1 x2 x3]';
    
    Tiempo(j-2)=DATOS.Time(j-2);
    Yest(j-2)=regresores' * theta;
    Ent(j-2)=DATOS.Data(j-2,1);
    Y(j-2)=DATOS.Data(j-2,2);
 
    end
plot(Tiempo,Ent, 'Color','[1 0 0]')
hold on;
plot(Tiempo,Y, 'Color','[0 1 0]')
hold on;    
plot(Tiempo,Yest, 'Color','[0 0 1]')
hold on; 
