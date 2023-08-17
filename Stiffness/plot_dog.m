function [a,b]=plot_dog(S_opt,sigma)
q=S_opt*sigma
    
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

%color_scale=linspace(0,1,10);
figure(1)
grid on 
axis equal
xlim([-400,500])
ylim([-400,0])
hold on 
color=[0,0,0];
a=plot(joints(:,1),joints(:,2),'linewidth',2,'Color',color);
b=scatter(joints(:,1),joints(:,2),10,color,'filled');
c=scatter(joints(8,1),joints(8,2),25,'red','filled');
d=scatter(joints(1,1),joints(1,2),25,'red','filled');
daspect([1,1,1])

end