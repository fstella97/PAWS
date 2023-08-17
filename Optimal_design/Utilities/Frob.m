function norm=Frob(A) 
norm=0;
for i=1:size(A,1)
    for j=1:size(A,2)
        if j>=i
            norm=norm+A(i,j);
        end
    end
end
