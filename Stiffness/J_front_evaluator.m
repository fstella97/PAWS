function J_front = J_front_evaluator(in1,in2)
%J_front_evaluator
%    J_front = J_front_evaluator(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    24-Apr-2023 22:19:21

s14 = in1(4);
s15 = in1(5);
s16 = in1(6);
s24 = in1(10);
s25 = in1(11);
s26 = in1(12);
s34 = in1(16);
s35 = in1(17);
s36 = in1(18);
sigma1 = in2(1,:);
sigma2 = in2(2,:);
sigma3 = in2(3,:);
t2 = s14+s15;
t3 = s24+s25;
t4 = s34+s35;
t5 = s14.*sigma1;
t6 = s15.*sigma1;
t7 = s16.*sigma1;
t8 = s24.*sigma2;
t9 = s25.*sigma2;
t10 = s26.*sigma2;
t11 = s34.*sigma3;
t12 = s35.*sigma3;
t13 = s36.*sigma3;
t17 = pi.*(3.0./2.0);
t18 = pi.*(5.0./4.0);
t19 = pi.*(7.0./4.0);
t14 = s16+t2;
t15 = s26+t3;
t16 = s36+t4;
t20 = t5+t8+t11+t18;
t23 = t5+t6+t8+t9+t11+t12+t19;
t26 = t5+t6+t7+t8+t9+t10+t11+t12+t13+t17;
t21 = cos(t20);
t22 = sin(t20);
t24 = cos(t23);
t25 = sin(t23);
t27 = cos(t26);
t28 = sin(t26);
J_front = reshape([s14.*t22.*-1.5e+2-t2.*t25.*1.3e+2-t14.*t28.*1.15e+2,s14.*t21.*1.5e+2+t2.*t24.*1.3e+2+t14.*t27.*1.15e+2,s24.*t22.*-1.5e+2-t3.*t25.*1.3e+2-t15.*t28.*1.15e+2,s24.*t21.*1.5e+2+t3.*t24.*1.3e+2+t15.*t27.*1.15e+2,s34.*t22.*-1.5e+2-t4.*t25.*1.3e+2-t16.*t28.*1.15e+2,s34.*t21.*1.5e+2+t4.*t24.*1.3e+2+t16.*t27.*1.15e+2],[2,3]);
