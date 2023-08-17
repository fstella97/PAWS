function [M_bar,Q_bar,Inertia_par,Q]=gen_symbolic_EOM_elements(Lagr_var,Lagr_var_der,pos_cm,Stiffness_tors_par,Damping_par)
% put the generalized coordinates in a column vector q
q = Lagr_var';
% and the time derivaties
qd = Lagr_var_der';

% put the cm coordinates in a column vector T
T = reshape(pos_cm.',1,[])';

% Jacobian dT/dq
Tq = jacobian(T,q);
dT = Tq * qd; % derivative of the mapping (i.e. velocities of the CoM's)

% Calculation of the convective terms
h = jacobian(dT,q)*qd;
h = simplify(h);

% Calculation of the stiffnes field
 K=gen_tors_spring(Stiffness_tors_par);
 % Calculation of the damping field
 D= gen_damping_matrix(Damping_par);
% Mass matrix
[M,Inertia_par]=gen_mass_matrix(pos_cm);
M_bar = (Tq)' * M * Tq;
M_bar = simplify(M_bar);

% Gravity force vector
f=gen_force_field(pos_cm);

% External motor forces 
Q=gen_input_torquefield(pos_cm);


%%
% C_qd=Tq'*M*h;
% C=simplify(Tq'*jacobian(dT,q));
% g_q=Tq'*f;
% The equation, as in my references is M_bar+C_qd+g_q=Q; the Jacobian is  Tq;

Q_bar = simplify(Q -K*q-D*qd+ (Tq)' * (f - M*h));

end