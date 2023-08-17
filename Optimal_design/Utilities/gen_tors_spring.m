function K= gen_tors_spring(Stiffness_tors_par,Unloaded_spring)
K=[]
for i=1:length(Stiffness_tors_par)
    K(i,i)=Stiffness_tors_par(i);
    if i>1
    K(i,i-1)=-Stiffness_tors_par(i);
    end
end
        
end
