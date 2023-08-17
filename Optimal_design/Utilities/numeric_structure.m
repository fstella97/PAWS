
function numeric_structure(pos_ee,Geom_var,Geom_var_num,Lagr_var)
pos_ee_num=subs(pos_ee,Geom_var,Geom_var_num);
matlabFunction(pos_ee_num,'File',strcat('Utilities/AutomaticallyGen/kinematic_structure_evaluator_num'),'Vars',{Lagr_var});
end