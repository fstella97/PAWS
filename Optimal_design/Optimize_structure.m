function [E_vect,r_pully,routing,S_opt]=Optimize_structure(S_goal)

%% Optimization 
% Input (goal) 


% Generation of symbolic variables 
%Structure specifications: 
 n_bodies=size(S_goal,1);      %there are as many DOF as the number of rows
 n_synergies=size(S_goal,2);   %there are as many tendons as the number of columns
   % Radius of pulley 
   for i=1:n_bodies
       for j=1:n_synergies
         r_pully(j,i)=str2sym(strcat('r',num2str(i),num2str(j)));
         assume(r_pully(j,i),'real');
       end
   end
   % Routing
   for i=1:n_bodies
       for j=1:n_synergies
         routing(j,i)=str2sym(strcat('on',num2str(i),num2str(j)));
         assume(routing(j,i),'real');
       end
   end
   
   % Stiffness
   for i=1:n_bodies
         E_vect(i)=str2sym(strcat('k',num2str(i)));
         assume(E_vect(i),'real');
   end
   
   
 % Generation of cost function 
EffectiveR=routing.*r_pully;  
E=diag(E_vect); %stiffness matrix
S_space=((inv(E)*EffectiveR'*inv(EffectiveR*inv(E)*EffectiveR')));

%Vector of variables 
variables=E_vect;
for i=1:n_synergies
variables=[variables,r_pully(i,:)];
end
for i=1:n_synergies
variables=[variables,routing(i,:)];
end
matlabFunction(sum(sum((S_space-S_goal).^2)),'File','Utilities/AutomaticallyGen/cost_function','Vars', {variables});

 % Generation of constraints
 lb_stiff=ones(1,n_bodies)*400;
 lb_pully=ones(1,n_bodies*n_synergies)*0;
 lb_routing=ones(1,n_bodies*n_synergies)*(-1);
 
 lb=[lb_stiff,lb_pully,lb_routing];
 
 ub_stiff=ones(1,n_bodies)*1200;
 ub_pully=ones(1,n_bodies*n_synergies)*0.65 ;
 ub_routing=ones(1,n_bodies*n_synergies);
 
 ub=[ub_stiff,ub_pully,ub_routing];
 
 
 %Optimization problem 
 FitnessFunction = @cost_function;
numberOfVariables = n_bodies*n_synergies*2+n_bodies;
% options = optimoptions('ga','MaxStallGenerations',50,'MaxGenerations',70);
%lb = [-Inf,-Inf,0.001,-Inf,0.001,-Inf];
%ub = [pi,Inf,pi,Inf,pi,Inf];
options = optimoptions('ga','PlotFcn','gaplotbestf','MaxStallGenerations',3000,'MaxGenerations',10000);%'gaplotscorediversity'
[x,fval,exitflag,output]  = ga(FitnessFunction,numberOfVariables,[],[],[],[],lb,ub,[],options);

fval
output
%% post-processing
E_vect=(x(1:n_bodies));
E=diag(E_vect);
r_pully=reshape(x(n_bodies+1:(n_bodies+n_bodies*n_synergies)),[n_bodies,n_synergies])';
routing=reshape(x((n_bodies+1+n_bodies*n_synergies):end),[n_bodies,n_synergies])';
r_pully=abs(r_pully.*routing);
routing=sign(routing);

EffectiveR=routing.*r_pully;  
S_opt=inv(E)*EffectiveR'*inv(EffectiveR*inv(E)*EffectiveR')
end
    




