function Q=gen_input_torquefield(pos_cm)
syms g real
Q=[];
for i=1:length(pos_cm(:,1))
    f(i)=str2sym(strcat('torque',num2str(i)));
    assume(f(i),'real');
    Q=[Q,f(i)];
end
Q=Q';
end