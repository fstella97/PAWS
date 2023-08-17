clear all 
close all 
clc
% %physical system

name = '__walk_loop.bvh';
[skeleton,time] = loadbvh(name);
d = mcread(name);
d10 = mc2local(d, 10); %transform data relative to hip
d29 = mc2local(d, 29); %transform data relative to shoulder

hip1 = mcgetmarker(d10, 10);
thigh1 = mcgetmarker(d10, 11);
calf1 = mcgetmarker(d10, 12);
foot1 = mcgetmarker(d10, 13);

hip2 = mcgetmarker(d29, 29);
thigh2 = mcgetmarker(d29, 30);
calf2 = mcgetmarker(d29, 31);
foot2 = mcgetmarker(d29, 32);

L1 = 150;

last = size(skeleton(1).Dxyz(3,:),2);
axis equal
xlim([-100,250])
ylim([-100,0])
grid on
hold on
for ff = 1:last  
        a = plot([-hip1.data(ff,3) -thigh1.data(ff,3)],...
        [hip1.data(ff,2) thigh1.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        b = plot([-thigh1.data(ff,3) -calf1.data(ff,3)],...
        [thigh1.data(ff,2) calf1.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        c = plot([-calf1.data(ff,3) -foot1.data(ff,3)],...
        [calf1.data(ff,2) foot1.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        scatter(-foot1.data(ff,3), foot1.data(ff,2), 25, 'filled', 'red')
        hold on

        d = plot([-hip2.data(ff,3)+L1 -thigh2.data(ff,3)+L1],...
        [hip2.data(ff,2) thigh2.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        e= plot([-thigh2.data(ff,3)+L1 -calf2.data(ff,3)+L1],...
        [thigh2.data(ff,2) calf2.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        f = plot([-calf2.data(ff,3)+L1 -foot2.data(ff,3)+L1],...
        [calf2.data(ff,2) foot2.data(ff,2)], 'LineWidth', 2, 'Color', 'black')
        hold on
        scatter(-foot2.data(ff,3)+L1, foot2.data(ff,2), 25, 'filled', 'red')
        hold on
    F(ff)=getframe;
    delete(a)
    delete(b)
    delete(c)
    delete(d)
    delete(e)
    delete(f)

end


% 
% 
% sigma=linspace(0,1,10);
%     for i=1:length(sigma)
% 
%         L1=330;
%         L2=150;
%         L3=130;
%         L4=75;
%         
%         % right part 
%         a1= 225/180*pi + S_opt(4)*sigma(i);
%         a2= 90/180*pi + S_opt(5)*sigma(i);
%         a3= (-90+45)/180*pi + S_opt(6,n)*sigma(i);
% %         a1= (225+90)/180*pi + S_opt(4,n)*sigma(i);
% %         a2= (90+180)/180*pi + S_opt(5,n)*sigma(i);
% %         a3= (-270-45)/180*pi + S_opt(6,n)*sigma(i);
%         
%         joint1= [L1/2,0];
%         joint2= joint1 + [L2*cos(a1),L2*sin(a1)];
%         joint3= joint2 + [L3*cos(a1+a2),L3*sin(a1+a2)];
%         joint4= joint3 + [L4*cos(a1+a2+a3),L4*sin(a1+a2+a3)];
%         
%         %left part 
%         a4=(225+90)/180*pi+ S_opt(3)*sigma(i);
%         a5=(90+180)/180*pi+ S_opt(2)*sigma(i);
%         a6=(-270-45)/180*pi+ S_opt(1)*sigma(i);
%         
%         joint5=[-L1/2,0];
%         joint6= joint5+[L2*cos(a4),L2*sin(a4)];
%         joint7= joint6+[L3*cos(a4+a5),L3*sin(a4+a5)];
%         joint8= joint7+[L4*cos(a4+a5+a6),L4*sin(a4+a5+a6)];
%         
%         joints=[joint8;joint7;joint6;joint5 ;joint1;joint2;joint3;joint4];
%         
%         
%         figure(n+2)
%         % title('S goal')
%         % 
%         % subplot(2,2,n)
%         title('Mode',num2str(n),'fontsize',21)
%         grid on 
%         xlim([-400,400])
%         ylim([-300,0])
%         hold on 
% %          color=[1+sigma(i),1+sigma(i),1+sigma(i)]
%           color=[1-sigma(i),1-sigma(i),1-sigma(i)]
%         plot(joints(:,1),joints(:,2),'linewidth',2,'Color',color)
%         scatter(joints(:,1),joints(:,2),10,color,'filled')
%         daspect([1,1,1])
%         %F=getframe(1);
% end