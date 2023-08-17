function plot_joints_stiffeness(waypoints,stiffness,cmap)

scatter([0;waypoints(1:end-1,1)],[0;waypoints(1:end-1,2)],90,stiffness','filled',...
                            'LineWidth',2)
colormap(flipud(cmap));
c=colorbar('TickLabelInterpreter', 'latex');

c.Label.String = 'Stiffness [N.mm/rad]';
c.Label.Interpreter = 'latex';
end
