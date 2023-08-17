function plot_spiral(joint_n,pos_ee_numeric,ampl,Geom_var_num)
if ~exist('Geom_var_num','var')
     Geom_var_num=1;
end
joint_n=joint_n-1;
R = ampl*mean(Geom_var_num)/10;
nturns = 2 ;    % number of turns (integer value)
phi = linspace(0, nturns*2*pi, 50) ; % 50= resolution
r = linspace(0, R, numel(phi)) ;
if joint_n==0
x = r .* cos(phi) ;
y = r .* sin(phi) ;
else
x = pos_ee_numeric(joint_n,1) + r .* cos(phi) ;
y = pos_ee_numeric(joint_n,2) + r .* sin(phi) ;
end
plot(x,y,'k-','linewidth',1) ;
end
