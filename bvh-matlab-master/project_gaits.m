clear all 
close all 
clc

% T = readtable('dog_1_joints');
T = readtable('dog_2_joints');
L = readtable('labels.csv','ReadVariableNames', false);
labels = L{:,:};
labels = labels';
cmap = jet(21);

%  q=T{[1:3 7:9],2:end};
q=T{[1:3 7:9],1:end};
%     q=T{[4:6 10:12],1:end};

q=[q(3,:);q(2,:);q(1,:);wrapTo180(q(4,:)-200);q(5,:);q(6,:)];
% q=[q(3,:);q(2,:);q(1,:);wrapTo180(q(4,:)+300);q(5,:);q(6,:)];

%   q=[q(3,:);q(2,:);q(1,:);wrapTo180(q(4,:)-275);q(5,:);q(6,:)];

%1
[coeff1,score1,latent,tsquared,explained]=pca(q');
explained

proj11=deg2rad(score1(:,1));
proj12=deg2rad(score1(:,2));
proj13=deg2rad(score1(:,3));

gscatter(proj11, proj12, labels, cmap, '', 10);

figure();
[~,~,id] = unique(labels);
uniq = unique(labels);

for idx = 1 : 21
    data = deg2rad(score1(id == idx,:));
    scatter3(data(:,1), data(:,2), data(:,3), 50, cmap(idx,:), 'Marker', '.', 'DisplayName', char(uniq(idx)));
    legend show;
    grid on;
    hold all;
end

%2
% [coeff2,score2,latent,tsquared,explained]=pca(exp(1i*deg2rad(q')));
% 
% proj21=abs(score2(:,1)).*sign(angle(score2(:,1)));
% proj22=abs(score2(:,2)).*sign(angle(score2(:,2)));
% proj23=abs(score2(:,3)).*sign(angle(score2(:,3)));
% % 
% 
% figure();
% gscatter(proj21, proj22, labels, cmap, '', 10);
% 
% 
% proj21=abs(score2(:,1)).*angle(score2(:,1));
% proj22=abs(score2(:,2)).*angle(score2(:,2));
% proj23=abs(score2(:,3)).*angle(score2(:,3));
% % 
% figure();
% gscatter(proj21, proj22, labels, cmap, '', 10);
% 
% 
% proj21=angle(score2(:,1));
% proj22=angle(score2(:,2));
% proj23=angle(score2(:,3));
% 
% figure();
% gscatter(proj21, proj22, labels, cmap, '', 10);


%3
X = cos(deg2rad(q'));
Y = sin(deg2rad(q'));
[coeff3,score3,latent,tsquared,explained]=pca([X,Y]);

proj31=score3(:,1);
proj32=score3(:,2);
proj33=score3(:,3);

figure();
gscatter(proj31, proj32, labels, cmap, '', 10);


figure();
[~,~,id] = unique(labels);
uniq = unique(labels);

for idx = 1 : 21
    data = deg2rad(score3(id == idx,:));
    scatter3(data(:,1), data(:,2), data(:,3), 50, cmap(idx,:), 'Marker', '.', 'DisplayName', char(uniq(idx)));
    legend show;
    grid on;
    hold all;
end


% % both left Back/FRONT LEGS ALONE
% q=T{[4:6 10:12],2:end};
% T{[4:6 10:12],1}
% [S2,score,latent,tsquared,explained]=pca(sin(deg2rad(q')));
% explained
% sum(explained(1:2))

