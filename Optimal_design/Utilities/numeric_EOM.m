function [M_bar_n,Q_bar_n]=numeric_EOM(M_bar,Q_bar,Geom_var,Inertia_par,Geom_var_num,Inertia_par_num)
M_bar_n=subs(M_bar,[Inertia_par,Geom_var],[Inertia_par_num,Geom_var_num]);
Q_bar_n=subs(Q_bar,[Inertia_par,Geom_var],[Inertia_par_num,Geom_var_num]);
M_bar_n=simplify(M_bar_n);
Q_bar_n=simplify(Q_bar_n);
end