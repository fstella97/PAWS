function ellips_generated= ellips(pos,R,r,c)
hold on
th = 0:pi/50:2*pi;
circle=[r * cos(th);r*sin(th)];
ellips=R*circle;
scatter(pos(1),pos(2),'filled','k')
ellips_generated = plot(ellips(1,:)+pos(1), ellips(2,:)+pos(2),'k','linewidth',1);
fill(ellips(1,:)+pos(1), ellips(2,:)+pos(2),  c,'FaceAlpha',0.3)
hold off
axis equal
end


%% Example to call it 
% pos= [0,1];
% K_x=[2,0;0,1];
% circleout = ellips(pos,K_x, 1, 'cyan')  ;


