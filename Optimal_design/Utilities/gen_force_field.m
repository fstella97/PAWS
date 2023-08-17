function f=gen_force_field(pos_cm)
g=9.81;
f=[];
for i=1:length(pos_cm(:,1))
    m(i)=str2sym(strcat('m',num2str(i)));
    assume(m(i),'real');
    f=[f,0,-m(i)*g,0];
end
f=f';
end