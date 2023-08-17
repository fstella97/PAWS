clear all 
close all 
clc

syms s11 s12 s13 s14 s15 s16  s21 s22 s23 s24 s25 s26  s31 s32 s33 s34 s35 s36 real 
syms sigma1 sigma2 sigma3 real 
syms goalx1 goaly1 goalx2 goaly2 real 
syms q1 q2 q3 q4 q5 q6 real 
S=[s11 s21 s31;...
   s12 s22 s32;...
   s13 s23 s33;...
   s14 s24 s34;...
   s15 s25 s35;...
   s16 s26 s36];
sigma=[sigma1;sigma2;sigma3];
q=S*sigma;

goal_front=[goalx1,goaly1];
goal_back=[goalx2,goaly2];

L1=500;
L2=150;
L3=130;
L4=115;

% right part 
a1=225/180*pi+ q(4);
a2=90/180*pi+ q(5);
a3=(-90+45)/180*pi+ q(6);

joint1=[L1/2,0];
joint2= joint1+[L2*cos(a1),L2*sin(a1)];
joint3= joint2+[L3*cos(a1+a2),L3*sin(a1+a2)];
joint4= joint3+[L4*cos(a1+a2+a3),L4*sin(a1+a2+a3)];

%left part 
a4=(225+90)/180*pi+ q(3);
a5=(90+180)/180*pi+ q(2);
a6=(-270-45)/180*pi+ q(1);

joint5=[-L1/2,0];
joint6= joint5+[L2*cos(a4),L2*sin(a4)];
joint7= joint6+[L3*cos(a4+a5),L3*sin(a4+a5)];
joint8= joint7+[L4*cos(a4+a5+a6),L4*sin(a4+a5+a6)];

joints=[joint8;joint7;joint6;joint5;joint1;joint2;joint3;joint4];

matlabFunction(joint8,'File',strcat('fk_back_evaluator'),'Vars',{S,sigma});
matlabFunction(joint4,'File',strcat('fk_front_evaluator'),'Vars',{S,sigma});

J_back= jacobian(joint8, sigma);
J_front=jacobian(joint4, sigma);
J_tot=jacobian([joint4,joint8], sigma);
matlabFunction(J_back,'File',strcat('J_back_evaluator'),'Vars',{S,sigma});
matlabFunction(J_front,'File',strcat('J_front_evaluator'),'Vars',{S,sigma});
matlabFunction(J_tot,'File',strcat('J_tot_evaluator'),'Vars',{S,sigma});

error_back=joint8-goal_back;
error_front=joint4-goal_front;
error_tot=[joint4,joint8]-[goal_front,goal_back];
matlabFunction(error_back,'File',strcat('error_back_evaluator'),'Vars',{S,sigma,goal_back});
matlabFunction(error_front,'File',strcat('error_front_evaluator'),'Vars',{S,sigma,goal_front});
matlabFunction(error_tot,'File',strcat('error_tot_evaluator'),'Vars',{S,sigma,[goal_front,goal_back]});


clc
clear all 

syms goalx1 goaly1 goalx2 goaly2 real 
syms q1 q2 q3 q4 q5 q6 real 
q=[q1 q2 q3 q4 q5 q6]';
goal_front=[goalx1,goaly1];
goal_back=[goalx2,goaly2];

L1=500;
L2=150;
L3=130;
L4=75;

% right part 
a1=225/180*pi+ q(4);
a2=90/180*pi+ q(5);
a3=(-90+45)/180*pi+ q(6);

joint1=[L1/2,0];
joint2= joint1+[L2*cos(a1),L2*sin(a1)];
joint3= joint2+[L3*cos(a1+a2),L3*sin(a1+a2)];
joint4= joint3+[L4*cos(a1+a2+a3),L4*sin(a1+a2+a3)];

%left part 
a4=(225+90)/180*pi+ q(3);
a5=(90+180)/180*pi+ q(2);
a6=(-270-45)/180*pi+ q(1);

joint5=[-L1/2,0];
joint6= joint5+[L2*cos(a4),L2*sin(a4)];
joint7= joint6+[L3*cos(a4+a5),L3*sin(a4+a5)];
joint8= joint7+[L4*cos(a4+a5+a6),L4*sin(a4+a5+a6)];

joints=[joint8;joint7;joint6;joint5;joint1;joint2;joint3;joint4];
J_tot_q=jacobian([joint4,joint8], q);

matlabFunction(J_tot_q,'File',strcat('J_tot_evaluator_q'),'Vars',{q});

