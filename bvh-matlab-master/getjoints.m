j = 0;
for i = [10,11,12,17,18,19,29,30,31,36,37,38]
    j = j+1;
    joints(j,:) = skeleton(i).rxyz(3,:);
end
disp(joints)