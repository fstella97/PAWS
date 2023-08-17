function plot_lin_tendon(pos_num,Pulley_num,Geom_var_num, Verso,color)
pos_num=[0,0,0;pos_num];
q=pos_num(:,3);
t=[];

for i=1: length(pos_num) -2
    if (and(not(Verso(i+1)==Verso(i)),not(Verso(i+1)==0)))%not(Verso(i)==0)
        epsilon(i)=acos((Pulley_num(i)+Pulley_num(i+1))/Geom_var_num(i));
        t_start=[pos_num(i,1),pos_num(i,2)]'+[cos(q(i+1)),-sin(q(i+1));sin(q(i+1)),cos(q(i+1))]*[Pulley_num(i)*cos(epsilon(i)),Verso(i)*Pulley_num(i)*sin(epsilon(i))]';  
        t_end=[pos_num(i+1,1),pos_num(i+1,2)]'+[cos(q(i+1)),-sin(q(i+1));sin(q(i+1)),cos(q(i+1))]*[Pulley_num(i+1)*cos(pi-epsilon(i)),Verso(i+1)*Pulley_num(i+1)*sin(pi-epsilon(i))]';
        t=[t;t_start';t_end'];
    end
     
    if and(Verso(i+1)==Verso(i),not(Verso(i+1)==0))
        epsilon(i)=acos((Pulley_num(i+1)-Pulley_num(i))/Geom_var_num(i));
        t_start=[pos_num(i,1),pos_num(i,2)]'+[cos(q(i+1)),-sin(q(i+1));sin(q(i+1)),cos(q(i+1))]*[Pulley_num(i)*cos(pi-epsilon(i)),Verso(i)*Pulley_num(i)*sin(pi-epsilon(i))]';  
        t_end=[pos_num(i+1,1),pos_num(i+1,2)]'+[cos(q(i+1)),-sin(q(i+1));sin(q(i+1)),cos(q(i+1))]*[Pulley_num(i+1)*cos(pi-epsilon(i)),Verso(i+1)*Pulley_num(i+1)*sin(pi-epsilon(i))]';
        t=[t;t_start';t_end'];
    end

    end
for a=1:length(t)/2
    i=2*a-1;
 plot(t(i:i+1,1),t(i:i+1,2),'-','color',color,'linewidth',2)
end
end
