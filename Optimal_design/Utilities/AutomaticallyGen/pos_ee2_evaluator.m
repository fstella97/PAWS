function pos_ee = pos_ee2_evaluator(L1,L2,q1,q2)
%POS_EE2_EVALUATOR
%    POS_EE = POS_EE2_EVALUATOR(L1,L2,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    24-Apr-2023 13:21:59

pos_ee = [L1.*cos(q1)+L2.*cos(q2),L1.*sin(q1)+L2.*sin(q2),q2];