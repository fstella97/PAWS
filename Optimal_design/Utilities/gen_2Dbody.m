function [Lagr_var,Lagr_var_der,Geom_var,pos_ee,pos_cm]=gen_2Dbody(body_n,start_point,length)
%syms(strcat('q',num2str(body_n)),'real')
Lagr_var=str2sym(strcat('q',num2str(body_n)));
Lagr_var_der=str2sym(strcat('qd',num2str(body_n)));
 assume(Lagr_var,'real');
 assume(Lagr_var_der,'real');
if ~exist('length','var')
     % third parameter does not exist, so default it to something
     Geom_var=str2sym(strcat('L',num2str(body_n)));
     assume(Geom_var,'real');
else
     Geom_var=length;
end

x_ee=start_point(1)+Geom_var*cos(Lagr_var);
y_ee=start_point(2)+Geom_var*sin(Lagr_var);
pos_ee=[x_ee,y_ee,Lagr_var];
x_cm=start_point(1)+1/2*Geom_var*cos(Lagr_var);
y_cm=start_point(2)+1/2*Geom_var*sin(Lagr_var);
pos_cm=[x_cm,y_cm,Lagr_var];

%Generate functions for position numerical evaluation
matlabFunction(pos_ee,'File',strcat('Utilities/AutomaticallyGen/pos_ee',num2str(body_n),'_evaluator'));
matlabFunction(pos_cm,'File',strcat('Utilities/AutomaticallyGen/pos_cm',num2str(body_n),'_evaluator'));
end



 

