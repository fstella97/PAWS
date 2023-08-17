function error_back = error_back_evaluator(in1,in2,in3)
%ERROR_BACK_EVALUATOR
%    ERROR_BACK = ERROR_BACK_EVALUATOR(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    24-Apr-2023 13:32:50

goalx2 = in3(:,1);
goaly2 = in3(:,2);
s11 = in1(1);
s12 = in1(2);
s13 = in1(3);
s21 = in1(7);
s22 = in1(8);
s23 = in1(9);
sigma1 = in2(1,:);
sigma2 = in2(2,:);
t2 = s11.*sigma1;
t3 = s12.*sigma1;
t4 = s13.*sigma1;
t5 = s21.*sigma2;
t6 = s22.*sigma2;
t7 = s23.*sigma2;
t8 = pi.*(3.0./2.0);
t9 = pi.*(7.0./4.0);
t10 = pi.*(1.3e+1./4.0);
t11 = t4+t7+t9;
t12 = t3+t4+t6+t7+t10;
t13 = t2+t3+t4+t5+t6+t7+t8;
error_back = [-goalx2+cos(t11).*1.5e+2+cos(t12).*1.3e+2+cos(t13).*7.5e+1-2.5e+2,-goaly2+sin(t11).*1.5e+2+sin(t12).*1.3e+2+sin(t13).*7.5e+1];