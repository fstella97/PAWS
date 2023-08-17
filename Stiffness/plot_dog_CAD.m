

function plot_dog_CAD(S,sigma)

q=S*sigma;
    
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



%color_scale=linspace(0,1,10);
figure(1)
grid on 
hold on 
color=[0.6,0.6,0.6];

% b=scatter(joints(:,1),joints(:,2),10,color,'filled');
% c=scatter(joints(8,1),joints(8,2),25,'red','filled');
% d=scatter(joints(1,1),joints(1,2),25,'red','filled');


%set(gcf,'Position',[1000 600 1500 750])
%
s = get(0, 'ScreenSize');
set(gcf,'Position', [0 0 s(3) s(4)])

hold on 
alpha=0.5;

gm = importGeometry("Base.stl");
gm=rotate(gm,-90,[0,0,0],[1,0,0]);
gm=translate(gm,[10,-255,-1000]);
gm=scale(gm,[1.4,1.5,1.5]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)

 hold on 
gm = importGeometry("bone150.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,a1*180/pi,[0,0,0],[0,0,1]);
gm=translate(gm,[joint1,-10]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)


hold on 
gm = importGeometry("bone130.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,(a1+a2)*180/pi,[0,0,0],[0,0,1]);
gm=translate(gm,[joint2,-8]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)


hold on 
gm = importGeometry("feet.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,(a1+a2+a3)*180/pi+90,[0,0,0],[0,0,1]);
gm=translate(gm,[joint3,-50]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)


hold on 
gm = importGeometry("bone150.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,a4*180/pi,[0,0,0],[0,0,1]);
gm=translate(gm,[joint5,-10]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)

hold on 
gm = importGeometry("bone130.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,(a4+a5)*180/pi,[0,0,0],[0,0,1]);
gm=translate(gm,[joint6,-8]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)


hold on 
gm = importGeometry("feet.stl");
gm=rotate(gm,90,[0,0,0],[1,0,0]);
gm=rotate(gm,(a4+a5+a6)*180/pi+90,[0,0,0],[0,0,1]);
gm=translate(gm,[joint7,-50]);
pdegplot(gm,"FaceLabels","off",'SubdomainLabels','off',"FaceAlpha",alpha)



% delete(findobj(gca,'type','Text')); 
delete(findobj(gca,'type','Quiver'));
findobj(gca,'type','Text')
H=findobj(gcf);
H(1).Children
%delete(findobj(gca,'type','Line')); makes it fancy


hold on 
%a=plot(joints(:,1),joints(:,2),'linewidth',2,'Color',color);
a=scatter(joints(:,1),joints(:,2),50,"filled",'red','MarkerFaceAlpha',.6,'MarkerEdgeAlpha',.6);

delete(findobj(gca,'type','Quiver'));
%delete(findobj(gca,'type','Line')); %makes it fancy
a=findobj(gcf)
for i=1:length(a)
    if not(or(isgraphics(a(i),'Line'),or(isgraphics(a(i),'Scatter'),or(isgraphics(a(i),'Axes'),or(isgraphics(a(i),'Patch'),isgraphics(a(i),'Figure'))))))
 delete(a(i))
    end
end

%camlight('left')
view(0,90)
daspect([1,1,1])
axis equal
xlim([-400,600])
ylim([-400,50])

end