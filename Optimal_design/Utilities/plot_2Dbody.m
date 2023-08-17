function plot_2Dbody(initial_point,end_point,color)
if ~exist('color','var')
     color=	[0, 0.4470, 0.7410];
end
plot([initial_point(1);end_point(1)],[initial_point(2);end_point(2)],'Linewidth',10,'color',color)

scatter(initial_point(1),initial_point(2),100,'k','MarkerEdgeColor','k',...
    'LineWidth',2)
              %'MarkerFaceColor',1/255*[200,200,200],...
             
% scatter(end_point(1),end_point(2),100,'k','MarkerEdgeColor','k',...
%               'MarkerFaceColor',1/255*[200,200,200],...
%               'LineWidth',2)
end