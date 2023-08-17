function [Lagr_var,Lagr_var_der,Geom_var,pos_ee,pos_cm]=gen_structure(tot_n_bodies)
[Lagr_var(1),Lagr_var_der(1),Geom_var(1),pos_ee(1,:),pos_cm(1,:)]=gen_2Dbody(1,[0,0]);
for i=1:tot_n_bodies-1
[Lagr_var(i+1),Lagr_var_der(i+1),Geom_var(i+1),pos_ee(i+1,:),pos_cm(i+1,:)]=gen_2Dbody(i+1,pos_ee(i,:));
end
matlabFunction(pos_ee,'File',strcat('Utilities/AutomaticallyGen/kinematic_structure_evaluator'),'Vars',{Lagr_var,Geom_var});
end