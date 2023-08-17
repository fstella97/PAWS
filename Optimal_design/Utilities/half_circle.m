function half_circle(center,x1,x2,radius,verso)
close all 
alpha1=pi*5/4;
alpha2=0;
if verso==1
angles = linspace(alpha1, -2*pi+alpha2, 20)
end
if verso==-1
angles = linspace(alpha1, alpha2, 20)
end

CenterX = center(1);
CenterY = center(2); 


xr = radius * cos(angles) + CenterX;
yr = radius * sin(angles) + CenterY;
t=[xr;yr]
hold on 
plot(xr,yr,'r','linewidth',1) ;

axis equal
end