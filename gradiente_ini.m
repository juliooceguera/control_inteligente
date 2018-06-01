heta = 0.01;
D_theta_paso = 0.01;
g_ant = [1 1 1]';
Hessiano_ant = eye(3);
theta_ant = [1 1 1]';
I_theta_ant = 1;
D_g_ant = [1 1 1]';

for i=1:in1p1.length/20
    theta = theta_ant - heta*Hessiano_ant*g_ant;
    x1 = in1p1.Data(i,1); 
    x2 = (in1p1.Data(i,1))^2;
    regresores = [1 x1 x2]';
    y_est = regresores' * theta;
    error = in1p1.Data(i,2) - y_est;
    I_theta= I_theta_ant+(error^2)/2;
    e_1=in1p1.Data(i,2)- [theta(1,1)+D_theta_paso, theta(2,1), theta(3,1)]*regresores;
    e_2=in1p1.Data(i,2)- [theta(1,1), theta(2,1)+D_theta_paso, theta(3,1)]*regresores;
    e_3=in1p1.Data(i,2)-[theta(1,1),theta(2,1),theta(3,1)+D_theta_paso]*regresores;
    I_theta_1= I_theta_ant + (e_1^2)/2;
    I_theta_2= I_theta_ant + (e_2^2)/2;
    I_theta_3= I_theta_ant + (e_3^2)/2;
    g = [((I_theta_1-I_theta)/D_theta_paso),((I_theta_2-I_theta)/D_theta_paso),((I_theta_3-I_theta)/D_theta_paso)]';
    D_theta_ant = theta - theta_ant;
    D_g_ant = g - g_ant;
    OP1 = D_theta_ant * D_g_ant';
    OP2=(D_theta_ant'*D_g_ant);
    OP=OP1/OP2;
    Hessiano= (eye(3)-OP)*Hessiano_ant*(eye(3)-OP)' + OP;
    g_ant=g;
    Hessiano_ant=Hessiano;
    theta_ant=theta;
    I_theta_ant=I_theta;
end


Yest=zeros(round(in1p1.length/20,0),1);
Ent=zeros(round(in1p1.length/20,0),1);
Y=zeros(round(in1p1.length/20,0),1);
Tiempo=zeros(round(in1p1.length/20,0),1);

    for j = 1: in1p1.length/20
    x1 = in1p1.Data(j,1); 
    x2 = (in1p1.Data(j,1))^2;
    
    Tiempo(j)=in1p1.Time(j);
    Yest(j)=theta(1,1)+theta(2,1)*x1+theta(3,1)*x2;
    Ent(j)=in1p1.Data(j,1);
    Y(j)=in1p1.Data(j,2);
 
    end
plot(Tiempo,Ent, 'Color','[1 0 1]')
hold on;
plot(Tiempo,Y, 'Color','[0 1 0]')
hold on;    
plot(Tiempo,Yest, 'Color','[1 0 0]')
hold on; 
