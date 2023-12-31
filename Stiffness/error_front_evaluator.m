function error_front = error_front_evaluator(in1,in2,in3)
%ERROR_FRONT_EVALUATOR
%    ERROR_FRONT = ERROR_FRONT_EVALUATOR(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    24-Apr-2023 22:19:22

goalx1 = in3(:,1);
goaly1 = in3(:,2);
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
t2 = s14.*sigma1;
t3 = s15.*sigma1;
t4 = s16.*sigma1;
t5 = s24.*sigma2;
t6 = s25.*sigma2;
t7 = s26.*sigma2;
t8 = s34.*sigma3;
t9 = s35.*sigma3;
t10 = s36.*sigma3;
t11 = pi.*(3.0./2.0);
t12 = pi.*(5.0./4.0);
t13 = pi.*(7.0./4.0);
t14 = t2+t5+t8+t12;
t15 = t2+t3+t5+t6+t8+t9+t13;
t16 = t2+t3+t4+t5+t6+t7+t8+t9+t10+t11;
error_front = [-goalx1+cos(t14).*1.5e+2+cos(t15).*1.3e+2+cos(t16).*1.15e+2+2.5e+2,-goaly1+sin(t14).*1.5e+2+sin(t15).*1.3e+2+sin(t16).*1.15e+2];
