function joint8 = fk_back_evaluator(in1,in2)
%FK_BACK_EVALUATOR
%    JOINT8 = FK_BACK_EVALUATOR(IN1,IN2)

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
t2 = s11.*sigma1;
t3 = s12.*sigma1;
t4 = s13.*sigma1;
t5 = s21.*sigma2;
t6 = s22.*sigma2;
t7 = s23.*sigma2;
t8 = s31.*sigma3;
t9 = s32.*sigma3;
t10 = s33.*sigma3;
t11 = pi.*(3.0./2.0);
t12 = pi.*(7.0./4.0);
t13 = pi.*(1.3e+1./4.0);
t14 = t4+t7+t10+t12;
t15 = t3+t4+t6+t7+t9+t10+t13;
t16 = t2+t3+t4+t5+t6+t7+t8+t9+t10+t11;
joint8 = [cos(t14).*1.5e+2+cos(t15).*1.3e+2+cos(t16).*1.15e+2-2.5e+2,sin(t14).*1.5e+2+sin(t15).*1.3e+2+sin(t16).*1.15e+2];
