clear all 
close all 
clc

% Include subfolders in the search path
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

% Insert geometrical input parameters
colors=[0.6350, 0.0780, 0.1840; 0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250]; %colors of the tendons, in order


T = readtable('dog_1_joints');

% both Right Back/FRONT LEGS ALONE
q=T{[1:3 7:9],2:end};
T{[1:3 7:9],1}
[S1,score,latent,tsquared,explained]=pca(q');
explained
sum(explained(1:2))
% both left Back/FRONT LEGS ALONE
q=T{[4:6 10:12],2:end};
T{[4:6 10:12],1}
[S2,score,latent,tsquared,explained]=pca(q');
explained
sum(explained(1:2))

% load('synergy');
% S=S1(:,1:2)
% S=S2(:,1:2)

S1 = [flip(S1(1:3,1:2),1); S1(4:6,1:2)]
S2 = [flip(S2(1:3,1:2),1); S2(4:6,1:2)]

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

% sigma=0:0.03:1;
% %% Video Creation
% %generate animation of each synergy
% writerObj=VideoWriter('Structure_animation','MPEG-4');
% % set the images per second
% writerObj.FrameRate=10 ;
% writerObj.VideoCompressionMethod
% open(writerObj);
% for v=1:n_synergies
%     singery_enable=zeros(length(sigma),n_synergies);
%     singery_enable(:,v)=sigma';
% for i=1:length(sigma)  
% q=S_opt*singery_enable(i,:)';
% pos_num=kinematic_structure_evaluator_num(rel2abs(q'));
% initialize_2Dfigure(1)
% title('Mode ',num2str(v),'Color',colors(v,:),'interpreter','latex')
% plot_rigid_structure(pos_num)
% plot_joints_stiffeness(pos_num,Stiffness_tors_par,gray(256))
% for k=1:length(M(:,1))
% plot_pulleys(pos_num,abs(EffectiveR(k,:)),colors(k,:))
% plot_lin_tendon(pos_num,Pulley_num(k,:),Geom_var_num, M(k,:),colors(k,:))
% end
%     xlim([-12,12])
%     ylim([-12,12])
%     F=getframe(gcf);
%     writeVideo(writerObj,F);
% end
% end
% % close the writer object
% close(writerObj);


sigma=0:0.03:2;
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
        end_eff(i,:) = pos_num(6,1:2);

        plot(end_eff(:,1),end_eff(:,2))
        for k=1:length(M(:,1))
            plot_pulleys(pos_num,abs(EffectiveR(k,:)),colors(k,:))
            plot_lin_tendon(pos_num,Pulley_num(k,:),Geom_var_num, M(k,:),colors(k,:))
        end
        xlim([-1,7])
        ylim([-5,5])
        F=getframe(gcf);
        writeVideo(writerObj,F);
        grid off;
        if first == 0
            set(gcf,'renderer','Painters')
            print(gcf,['Firstt ' num2str(w)],'-dpdf','-bestfit')
            first = 1;
        end
    end
    set(gcf,'renderer','Painters')
    print(gcf,['Modee ' num2str(v) num2str(w)],'-dpdf','-bestfit')

end
% close the writer object
close(writerObj);
end
