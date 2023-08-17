function plot_2Dtendon(initial_point,end_point,color)
if ~exist('color','var')
     color=	[0.9290, 0.6940, 0.1250];
end
plot([initial_point(1);end_point(1)],[initial_point(2);end_point(2)],'Linewidth',3,'color',color)
end