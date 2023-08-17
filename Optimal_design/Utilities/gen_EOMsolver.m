function gen_EOMsolver(M_bar_n,Q_bar_n,Lagr_var,Lagr_var_der,Q)
Acc=simplify(M_bar_n\Q_bar_n);
matlabFunction([Lagr_var_der'; Acc]','File','Utilities/AutomaticallyGen/eom_solver','Vars', {[Lagr_var,Lagr_var_der],Q'});
end

