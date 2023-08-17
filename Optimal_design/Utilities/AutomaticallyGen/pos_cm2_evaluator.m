function pos_cm = pos_cm2_evaluator(L1,L2,q1,q2)
%POS_CM2_EVALUATOR
%    POS_CM = POS_CM2_EVALUATOR(L1,L2,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    24-Apr-2023 13:21:59

pos_cm = [L1.*cos(q1)+(L2.*cos(q2))./2.0,L1.*sin(q1)+(L2.*sin(q2))./2.0,q2];