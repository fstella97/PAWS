function D= gen_damping_matrix(Damping_par)
D=[];
for i=1:length(Damping_par)
    D(i,i)=Damping_par(i);
    if i>1
    D(i,i-1)=-Damping_par(i);
    end
end
        
end