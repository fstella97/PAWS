function pos_cm = pos_cm1_evaluator(L1,q1)
%POS_CM1_EVALUATOR
%    POS_CM = POS_CM1_EVALUATOR(L1,Q1)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    24-Apr-2023 13:21:59

pos_cm = [(L1.*cos(q1))./2.0,(L1.*sin(q1))./2.0,q1];
