%%                         Synergies concept 
%% Fully actuated case
% q \in R^n: joint coordinates
% sigma \in R^n: 
% S \in R^n \times n: base of the synergies
n=2;
sigma=[1,0]';
S=[1,0;0,1]; % or any orthogonal base
% check for ortogonality
if S*S'== eye(n)
    disp('orthogonal')
end
% Gram-Schmidt orthogonalization method can be used to generate orthogonal bases
% from random vectors (ideal synergies)

q=S*sigma;

%% Underactuated case
syms k1 k2 k3 real
syms r11 r12 r13 r21 r22 r23 real 
syms on11 on12 on13 on21 on22 on23 real 
sigma=[1,0]'; %activation of tendons
%sigma=R*q;
n=3; a=2;
M= [on11,on12,on13;...
    on21,on22,on23]; % Matrix for tendon routing, it can get only 1, -1 and 0 values
R= [r11,r12,r13;...
    r21,r22,r23]; % matrix of the radius of pulleys
EffectiveR=M.*R
E=diag([k1,k2,k3]); %stiffness matrix
S=simplify((inv(E)*EffectiveR'*inv(EffectiveR*inv(E)*EffectiveR')));
%constraint S*S'==eye(n)
q=S*sigma;



