heta = 0.001;
D_theta_paso = 0.001;
g_ant = [1 1 1 1 1 1]';
Hessiano_ant = eye(6);
theta_ant = [1 1 1 1 1 1]';
D_g_ant = [1 1 1 1 1 1]';
Div_Num_Datos=38;
for i=4:in1p1.length/Div_Num_Datos
    i
    theta = theta_ant - heta*Hessiano_ant*g_ant;
    I_theta=0;
    I_theta_1=0;
    I_theta_2=0;
    I_theta_3=0;
    I_theta_4=0;
    I_theta_5=0;
    I_theta_6=0;
    for w=4:i
    x1 = in1p1.Data(w-1,1); 
    x2 = in1p1.Data(w-2,1);
    x3 = in1p1.Data(w-3,1);
    y1=in1p1.Data(w-1,2);
    y2=in1p1.Data(w-2,2);
    y3=in1p1.Data(w-3,2);   
    regresores = [x1 x2 x3 y1 y2 y3]';
    y_est = regresores' * theta;
    error = in1p1.Data(w,2) - y_est;
    I_theta= I_theta+(error^2)/2;
    e_1=in1p1.Data(w,2)- regresores'*[theta(1,1)+D_theta_paso, theta(2,1), theta(3,1),theta(4,1),theta(5,1), theta(6,1)]';
    e_2=in1p1.Data(w,2)- regresores'*[theta(1,1), theta(2,1)+D_theta_paso, theta(3,1),theta(4,1),theta(5,1), theta(6,1)]';
    e_3=in1p1.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1)+D_theta_paso,theta(4,1),theta(5,1), theta(6,1)]';
    e_4=in1p1.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1),theta(4,1)+D_theta_paso,theta(5,1), theta(6,1)]';
    e_5=in1p1.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1),theta(4,1),theta(5,1)+D_theta_paso, theta(6,1)]';
    e_6=in1p1.Data(w,2)- regresores'*[theta(1,1), theta(2,1), theta(3,1),theta(4,1),theta(5,1), theta(6,1)+D_theta_paso]';
    I_theta_1= I_theta_1 + (e_1^2)/2;
    I_theta_2= I_theta_2 + (e_2^2)/2;
    I_theta_3= I_theta_3 + (e_3^2)/2;
    I_theta_4= I_theta_4 + (e_4^2)/2;
    I_theta_5= I_theta_5 + (e_5^2)/2;
    I_theta_6= I_theta_6 + (e_6^2)/2;
    end
    g = [((I_theta_1-I_theta)/D_theta_paso),((I_theta_2-I_theta)/D_theta_paso),(I_theta_3-I_theta)/D_theta_paso,(I_theta_4-I_theta)/D_theta_paso,(I_theta_5-I_theta)/D_theta_paso,((I_theta_6-I_theta)/D_theta_paso)]';
    D_theta_ant = theta - theta_ant;
    D_g_ant = g - g_ant;
    OP1 = D_theta_ant * D_g_ant';
    OP2=(D_theta_ant'*D_g_ant);
    OP=OP1/OP2;
    Hessiano= (eye(6)-OP)*Hessiano_ant*(eye(6)-OP)' + OP;
    g_ant=g;
    Hessiano_ant=Hessiano;
    theta_ant=theta;
    
end


Yest=zeros(round(in1p1.length,0),1);
Ent=zeros(round(in1p1.length,0),1);
Y=zeros(round(in1p1.length,0),1);
Tiempo=zeros(round(in1p1.length,0),1);

    for j = 4: in1p1.length
    x1 = in1p1.Data(j-1,1); 
    x2 = in1p1.Data(j-2,1);
    x3 = in1p1.Data(j-3,1);
    y1=in1p1.Data(j-1,2);
    y2=in1p1.Data(j-2,2);
    y3=in1p1.Data(j-3,2);   
    regresores = [x1 x2 x3 y1 y2 y3]';
    
    Tiempo(j)=in1p1.Time(j);
    Yest(j)=regresores' * theta;
    Ent(j)=in1p1.Data(j,1);
    Y(j)=in1p1.Data(j,2);
 
    end
plot(Tiempo,Ent, 'Color','[1 0 0]')
hold on;
plot(Tiempo,Y, 'Color','[0 1 0]')
hold on;    
plot(Tiempo,Yest, 'Color','[0 0 1]')
hold on; 
