function pos_ee = pos_ee1_evaluator(L1,q1)
%POS_EE1_EVALUATOR
%    POS_EE = POS_EE1_EVALUATOR(L1,Q1)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    24-Apr-2023 13:21:58

pos_ee = [L1.*cos(q1),L1.*sin(q1),q1];