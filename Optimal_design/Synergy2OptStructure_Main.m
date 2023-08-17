clear all 
close all 
clc
set(gcf,'renderer','Painters')

% Include subfolders in the search path
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

% Insert geometrical input parameters
colors=[0.6350, 0.0780, 0.1840; 0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250]; %colors of the tendons, in order

% S=[0.128,0.099;...
%    0.754, -0.656;...
%    0.64,0.748];

S1 =    [-1   1;
   2   1;
    1   -1]


S2 =    [1   1;
   1   -1;
    1   1]

Syns = {S1, S2};

for w = 1:numel(Syns)
    S = Syns{w};
tot_n_bodies=            size(S,1);
n_synergies=             size(S,2);
Geom_var_num=        ones(1,tot_n_bodies);          % length of the segments in m 
[Stiffness_tors_par,Pulley_num,M,S_opt]= Optimize_structure(S);
EffectiveR=M.*Pulley_num;



% Automatically generate structures 
[Lagr_var,Lagr_var_der,Geom_var,pos_ee,pos_cm]=gen_structure(tot_n_bodies);
numeric_structure(pos_ee,Geom_var,Geom_var_num,Lagr_var);

sigma=0:0.03:1;
%% Video Creation
%generate animation of each synergy
writerObj=VideoWriter('Structure_animation','MPEG-4');
% set the images per second
writerObj.FrameRate=10 ;
writerObj.VideoCompressionMethod
open(writerObj);
for v=1:n_synergies
    end_eff = [];
    first=0;
    singery_enable=zeros(length(sigma), n_synergies);
    singery_enable(:,v) = sigma';
    for i=1:length(sigma)  
        q=S_opt*singery_enable(i,:)';
        pos_num=kinematic_structure_evaluator_num(rel2abs(q'));
        initialize_2Dfigure(1)
        title(['Synergy ' num2str(v)],'Color',colors(v,:),'interpreter','latex')
        plot_rigid_structure(pos_num)
        plot_joints_stiffeness(pos_num,Stiffness_tors_par,gray(256))
        end_eff(i,:) = pos_num(3,1:2);
        plot(end_eff(:,1),end_eff(:,2))
        for k=1:length(M(:,1))
            plot_pulleys(pos_num,abs(EffectiveR(k,:)),colors(k,:))
            plot_lin_tendon(pos_num,Pulley_num(k,:),Geom_var_num, M(k,:),colors(k,:))
        end
        xlim([-2,4])
        ylim([-2,4])
        F=getframe(gcf);
        writeVideo(writerObj,F);
        grid off;
        if first == 0
            set(gcf,'renderer','Painters')
            print(gcf,['First ' num2str(w)],'-dpdf','-bestfit')
            first = 1;
        end
    end
    set(gcf,'renderer','Painters')
    print(gcf,['Mode ' num2str(v) num2str(w)],'-dpdf','-bestfit')

end
% close the writer object
close(writerObj);
end

