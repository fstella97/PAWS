clear all 
close all 
clc

% Include subfolders in the search path
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

% Insert geometrical input parameters
colors=[0.6350, 0.0780, 0.1840; 0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250]

tot_n_bodies=        3;
Geom_var_num=        [100,100,100];          % length of the segments in m 
Pulley_num=          [76/2,36/2,76/2;...
                      36/2,36/2,36/2];    % radius of the pulley
M=                   [-1,1,-1;...
                      1,1,1];          % senso di avvolgimento (1 orario, -1 antiorario)                  
K_spring=2.89; %N/mm
Stiffness_tors_par=1/2*K_spring*[30/2,30/2,45/2].^2; % stiffness is defined respect to 0 absolute value! 

 
EffectiveR=M.*Pulley_num;
E=diag(Stiffness_tors_par); %stiffness matrix
S=((inv(E)*EffectiveR'*inv(EffectiveR*inv(E)*EffectiveR')));



Inertia_par_num=     [1,1,1,1,1,1];    % in the form [m_i,I_i..]
Stiffness_tors_par=  [142,142,213]; 

% Automatically generate structures 
[Lagr_var,Lagr_var_der,Geom_var,pos_ee,pos_cm]=gen_structure(tot_n_bodies);
numeric_structure(pos_ee,Geom_var,Geom_var_num,Lagr_var);

sigma1=0:3:120;
%% Video Creation
writerObj=VideoWriter('Structure_animation','MPEG-4');
% set the images per second
writerObj.FrameRate=10 ;
writerObj.VideoCompressionMethod
open(writerObj);
for i=1:length(sigma1)  
    
q=S*[sigma1(i),0]';
pos_num=kinematic_structure_evaluator_num(rel2abs(q'));
initialize_2Dfigure(1)
plot_rigid_structure(pos_num)
plot_joints_stiffeness(pos_num,Stiffness_tors_par,gray(256))
for k=1:length(M(:,1))
plot_pulleys(pos_num,abs(EffectiveR(k,:)),colors(k,:))
plot_lin_tendon(pos_num,Pulley_num(k,:),Geom_var_num, M(k,:),colors(k,:))
end
    xlim([-450,450])
    ylim([-450,450])
    F=getframe(gcf);
    writeVideo(writerObj,F);
end
% close the writer object
close(writerObj);


