function plot_elastic_structure(Stiffness_tors_par,pos_ee_numeric,Geom_var_num)
for i=1:length(Stiffness_tors_par)
    ampl=Stiffness_tors_par(i);
    plot_spiral(i,pos_ee_numeric,ampl,Geom_var_num)
end
end