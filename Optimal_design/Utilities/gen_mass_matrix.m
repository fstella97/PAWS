function [M,Inertia_par]=gen_mass_matrix(pos_cm)
diag_vector=[];
Inertia_par=[];
for i=1:length(pos_cm(:,1))
    m(i)=str2sym(strcat('m',num2str(i)));
    I(i)=str2sym(strcat('I',num2str(i)));
    assume(m(i),'real');
    assume(I(i),'real');
    Inertia_par=[Inertia_par,m(i),I(i)];
    diag_vector=[diag_vector,m(i),m(i),I(i)];
end
M=diag(diag_vector);
end