function J_back = J_back_evaluator(in1,in2)
%J_back_evaluator
%    J_back = J_back_evaluator(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    24-Apr-2023 22:19:21

s11 = in1(1);
s12 = in1(2);
s13 = in1(3);
s21 = in1(7);
s22 = in1(8);
s23 = in1(9);
s31 = in1(13);
s32 = in1(14);
s33 = in1(15);
sigma1 = in2(1,:);
sigma2 = in2(2,:);
sigma3 = in2(3,:);
t2 = s12+s13;
t3 = s22+s23;
t4 = s32+s33;
t5 = s11.*sigma1;
t6 = s12.*sigma1;
t7 = s13.*sigma1;
t8 = s21.*sigma2;
t9 = s22.*sigma2;
t10 = s23.*sigma2;
t11 = s31.*sigma3;
t12 = s32.*sigma3;
t13 = s33.*sigma3;
t17 = pi.*(3.0./2.0);
t18 = pi.*(7.0./4.0);
t19 = pi.*(1.3e+1./4.0);
t14 = s11+t2;
t15 = s21+t3;
t16 = s31+t4;
t20 = t7+t10+t13+t18;
t23 = t6+t7+t9+t10+t12+t13+t19;
t26 = t5+t6+t7+t8+t9+t10+t11+t12+t13+t17;
t21 = cos(t20);
t22 = sin(t20);
t24 = cos(t23);
t25 = sin(t23);
t27 = cos(t26);
t28 = sin(t26);
J_back = reshape([s13.*t22.*-1.5e+2-t2.*t25.*1.3e+2-t14.*t28.*1.15e+2,s13.*t21.*1.5e+2+t2.*t24.*1.3e+2+t14.*t27.*1.15e+2,s23.*t22.*-1.5e+2-t3.*t25.*1.3e+2-t15.*t28.*1.15e+2,s23.*t21.*1.5e+2+t3.*t24.*1.3e+2+t15.*t27.*1.15e+2,s33.*t22.*-1.5e+2-t4.*t25.*1.3e+2-t16.*t28.*1.15e+2,s33.*t21.*1.5e+2+t4.*t24.*1.3e+2+t16.*t27.*1.15e+2],[2,3]);