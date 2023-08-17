clear all 
close all 
clc
% 
% 
addpath('./CAD')
R=[0.5000    0.5000    0.5000    0.0851    0.4529    0.4067;...
    0.1284    0.2198    0.5000    0.5000    0.5000    0.5000];
% 
E=diag(([12.2841   11.7647   24.9567   11.7647   21.5361   24.9567]*2.89/2).^2);
% 

C_q= inv(E)- inv(E)*R'*inv(R*inv(E)*R')*R*inv(E);
% 
% q=[1,1,1,1,1,1]';
% for i=1:length(q(1,:))
% J=J_front_evaluator(q(:,i));
% K_x=inv(J*C_q*J')
% 
% end
S = [0.6586    0.0201   -0.0771    
     0.7120    0.1830   -0.0767    
     0.1666   -0.1574   -0.0085    
    -0.0732    0.9146    0.3367   
     0.1592   -0.3221    0.8806    
    -0.0277   -0.0319    0.3151];



Pos_base=[150.8579 -272.9899];
limit_x=180;limit_y=100;
Grid_x=linspace(-limit_x,+limit_x,3);
Grid_y=linspace(-limit_y,+limit_y,3);
sigma_init=[0,0,0]';
for i=1:length(Grid_x)
    for j=1:length(Grid_y)
        target_pose=Pos_base+[Grid_x(i),Grid_y(j)];
        sigma=proj2man_front(S,sigma_init,target_pose,2,10000);
        
        q=S*sigma;
       %
        if not(isnan(q))
        plot_dog_CAD(S,sigma);
        xlim([-50,400])
        F(i)=getframe(1);
        J=J_tot_evaluator_q(q);
        K_x=inv(J*C_q*J');
        K_x(1:2,1:2)
        ellips(target_pose,K_x(1:2,1:2),30/mean(mean(K_x(1:2,1:2))),'cyan')
        end
    end
end


function q_projected=proj2man_front(S,q,goal,epsilon,maxiteration)
q_projected=[Inf;Inf;Inf]; %if it returns Inf it didn't converged to the nullspace manifold
for i=0:maxiteration
 Dx=error_front_evaluator(S,q,goal);
%  pos=fk_back_evaluator(S,q);
%  Dx=pos-goal
if norm(Dx)<epsilon
    q_projected=q;
    break
else  
   J=J_front_evaluator(S,q);
   q=q-pinv(J)*(Dx'/2);
end
end
end

function q_projected=proj2man_tot(S,q,goal,epsilon1,epsilon2,maxiteration)
q_projected=[Inf;Inf]; %if it returns Inf it didn't converged to the nullspace manifold
for i=0:maxiteration
 Dx=error_tot_evaluator(S,q,goal);
% if and(norm(Dx(1:2))<epsilon1,norm(Dx(3:4))<epsilon2)
%     q_projected=q;
%     break
% else  


   J=J_tot_evaluator(S,q);
   q=q-pinv(J)*(Dx'/2);
end
q_projected=q;
end
