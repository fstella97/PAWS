function q_abs=rel2abs(q_rel)
q_abs=zeros(1,length(q_rel));
for i=1:length(q_rel)
    q_abs(i)=sum(q_rel(1:i));
end
end
    