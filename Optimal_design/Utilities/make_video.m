function make_video(y,xlimit,ylimit)
%% Video Creation
writerObj=VideoWriter('Structure_animation','MPEG-4');
% set the images per second
writerObj.FrameRate=40 ;
writerObj.VideoCompressionMethod

% open the video writer
open(writerObj);
factor=6;
for a=1:length(y(:,1))/factor
    i=a*factor;
    q=y(i,1:length(y(1,:))/2); 
    pos_num=kinematic_structure_evaluator_num(q);
    initialize_2Dfigure(1)
    plot_rigid_structure(pos_num)
    %plot_elastic_structure(Stiffness_tors_par,pos_num,Geom_var_num)
    xlim(xlimit)
    ylim(ylimit)
    F=getframe(gcf);
    writeVideo(writerObj,F);
end
% close the writer object
close(writerObj);
end