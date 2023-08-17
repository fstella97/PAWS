function plot_pulleys(pos_num,radius_effective,color)
angles = linspace(0, 2*pi, 100);

for i=1: length(pos_num)
   
radius = radius_effective(i);
if i==1
CenterX = 0;
CenterY = 0; 
else
CenterX = pos_num(i-1,1);
CenterY =  pos_num(i-1,2);
end

x = radius * cos(angles) + CenterX;
y = radius * sin(angles) + CenterY;
v = [x',y'];
f = 1:1:length(x);
patch('Faces',f,'Vertices',v,'FaceColor','black','FaceAlpha',.2);
plot(x,y,'-','color','k','linewidth',1) ;
if and(and(i>1,i<length(pos_num)),not(radius_effective(i)==0))
plot(x,y,'-','color','k','linewidth',1.5) ;
plot(x,y,'-','color',color,'linewidth',1) ;
end
end

axis equal
end