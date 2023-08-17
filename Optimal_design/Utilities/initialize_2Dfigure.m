function initialize_2Dfigure(n_figure,xlabeltxt,ylabeltxt,legendtxt)
if ~exist('xlabeltxt','var')
     xlabeltxt='x [mm]';
end
if ~exist('ylabeltxt','var')
     ylabeltxt='y [mm]';
end

figure(n_figure)
clf
hold on 
grid on 
grid minor 

set(gcf, 'Position', [10   55   800   700])   %[x y width height]

set(gca,'FontSize',22)
xlabel(xlabeltxt, 'interpreter', 'latex', 'FontSize',24)
ylabel(ylabeltxt, 'interpreter', 'latex', 'FontSize',24)
set(    gca, 'TickLabelInterpreter', 'latex')
if exist('legendtxt','var')
hl = legend({legendtxt});
set(hl,'Interpreter','latex','orientation','horizontal','location','southwest');
end
box on
end