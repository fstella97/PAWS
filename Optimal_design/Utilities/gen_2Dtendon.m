function t_length=gen_2Dtendon(tendon_n,start_point,end_point)
syms(strcat('t',num2str(tendon_n)),'real')
t_var=str2sym(strcat('t',num2str(tendon_n)));
assume(t_var,'real');
 
t_length=sqrt((start_point(1)-end_point(1))^2+(start_point(2)-end_point(2))^2);
matlabFunction(t_length,'File',strcat('Utilities/AutomaticallyGen/t',num2str(tendon_n),'_evaluator'));
end
