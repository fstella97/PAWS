function q_rel=abs2rel(q_abs)
q_rel=zeros(1,length(q_abs));
q_abs=[0,q_abs];
for i=2:length(q_abs)
    q_rel(i-1)=q_abs(i)-q_abs(i-1);
end
end
    
    
