function plot_rigid_structure(waypoints,color)
if ~exist('color','var')
     color=	[0, 0.4470, 0.7410];
end
plot_2Dbody([0,0],waypoints(1,:),color)
for i=1:length(waypoints(:,1))-1
plot_2Dbody(waypoints(i,:),waypoints(i+1,:),color)
end
end