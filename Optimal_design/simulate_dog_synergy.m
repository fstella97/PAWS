clear all 
close all 
clc
% %S_opt =[    0.9002    0.2722; max 45 
%    -0.5619   -0.2348;
%    -0.5148    0.1432;
%    -0.2823    0.1443;
%    -0.2224    0.7618;
%     0.0866   -0.7736]

%max 40
S_opt =[0.9009    0.3619;
   -0.5707   -0.2636;
   -0.5502    0.1926;
   -0.4092    0.1432;
   -0.2485    0.7945;
    0.1048   -0.8080];

%max 50
% S_opt =[ 0.8606    0.2389;
%    -0.5394   -0.1646;
%    -0.4680    0.1078;
%    -0.1887    0.1533;
%    -0.2028    0.7481;
%     0.0719   -0.7505];

%max 55
    S_opt =[
    0.8112    0.2071;
   -0.4752   -0.1318;
   -0.4327    0.0462;
   -0.1410    0.1598;
   -0.1939    0.7387;
    0.0671   -0.7321;
]
% 
% 
% % S goal 1
% S_opt= [    0.7830   0.1620;
%    -0.4449   -0.0800;
%    -0.3813   -0.0114;
%    -0.1071    0.1185;
%    -0.1720    0.6977;
%     0.0500   -0.6829]

% 
% S_opt=[0.7922   -0.1176;
%    -0.4698    0.0356;
%    -0.3710   -0.0015;
%     0.0022   -0.0753;
%    -0.1074   -0.6949;
%     0.0494    0.7045]

% % S general
% 4 modes

% S_opt= [0.7830    0.1620   -0.2124    0.4625;
%    -0.4449   -0.0800   -0.5336    0.2960;
%    -0.3813   -0.0114   -0.0614    0.5558;
%    -0.1071    0.1185    0.4212   -0.2549;
%    -0.1720    0.6977    0.4442    0.3876;
%     0.0500   -0.6829    0.5401    0.4176];

% 6 modes 
S_opt=[0.7830    0.1620   -0.2124    0.4625    0.2675    0.1734;
   -0.4449   -0.0800   -0.5336    0.2960   -0.0066    0.6505;
   -0.3813   -0.0114   -0.0614    0.5558    0.4769   -0.5606;
   -0.1071    0.1185    0.4212   -0.2549    0.7508    0.4104;
   -0.1720    0.6977    0.4442    0.3876   -0.3357    0.1528;
    0.0500   -0.6829    0.5401    0.4176   -0.1565    0.2016];

% S_opt = [    0.7922   -0.1176   -0.1414    0.5062    0.0683    0.2788;
%    -0.4698    0.0356   -0.3969    0.6789   -0.3992    0.0141;
%    -0.3710   -0.0015    0.1099    0.1752    0.6475    0.6327;
%     0.0022   -0.0753    0.2529   -0.2381   -0.6416    0.6798;
%    -0.1074   -0.6949    0.6032    0.3020   -0.0294   -0.2229;
%     0.0494    0.7045    0.6186    0.3230   -0.0646   -0.1001]
% backlegs
% S_opt= [0.6275   -0.4946    0.4708    0.1823   -0.3193    0.0684;
%    -0.4185    0.1726    0.5152   -0.1623   -0.2838    0.6502;
%    -0.2687    0.3138    0.2455    0.6420   -0.3837   -0.4580;
%    -0.1974   -0.3152   -0.0078    0.6588    0.5430    0.3643;
%    -0.3321   -0.3191    0.5601   -0.3040    0.3916   -0.4778;
%     0.4578    0.6526    0.3726    0.0420    0.4713    0.0424];

% 1 leg, 3 modes
% S_opt = [    1.4286    1.4286   -0.0000;
%    -0.7473    0.6812   -1.4286;
%    -0.6812    0.7473    1.4286;]

% %max 30
% S_opt = [
%     1.0553    0.3304;
%    -0.5540   -0.5525;
%    -0.4878   -0.4865;
%    -0.4395    0.4385;
%    -0.7617    0.7598;
%     0.2012   -0.9831;]
% % 
% S_opt = [    0.9523    0.5733;
%    -0.6743   -0.4340;
%    -0.4967    0.4174;
%    -0.4648    0.3906;
%    -0.7138    0.5998;
%    -0.0731   -0.9328]
% S_opt = [     0.9989    0.5022;
%    -0.6961   -0.3500;
%    -0.7061    0.2230;
%    -0.4940    0.1560;
%    -0.3272    0.9019;
%     0.1677   -0.8973]

%max 45
%  S_opt = [    0.8893    0.3081   -0.2522;
%    -0.6478   -0.2045   -0.5011;
%    -0.4846    0.1418   -0.2331;
%    -0.1952    0.3676    0.3036;
%    -0.2407    0.7296    0.5519;
%     0.0467   -0.7455    0.5956]

% % second half
%  S_opt = [    0.8861   -0.2079   -0.1682;
%    -0.5589   -0.1593   -0.4738;
%    -0.4738    0.0627    0.1405;
%     0.2189   -0.3188    0.2991;
%    -0.2213   -0.8569    0.6610;
%     0.0806    0.8921    0.6410;
% ]
% S_opt = [    1.7476    0.0226   -0.4933;
%    -0.9871    0.0343   -0.7478;
%    -0.9017   -0.0117    0.2545;
%     0.0472   -0.7792    0.5537;
%     0.0614   -1.0141    0.7206;
%     0.1086    1.8431    1.2743]
% %physical system
S_opt = [    1.7476    0   -0.4933;
   -0.9871    0   -0.7478;
   -0.9017   0    0.2545;
    0   -0.7792    0.5537;
    0   -1.0141    0.7206;
    0    1.8431    1.2743]

S_opt =  [   0.0256    0.7921    0.0786;
   -0.1463   -0.4311   -0.0761;
   -0.0457   -0.3740    0.1007;
    0.9260   -0.0691    0.2508;
    0.3113   -0.1707   -0.3550;
   -0.1467   -0.1134    0.8882]
S_opt = [   -0.4876    0.6172    0.1786;
    0.2437   -0.3785   -0.0478;
    0.2674   -0.2695    0.1404;
    0.7327    0.5548    0.3421;
    0.2971    0.1219   -0.4220;
   -0.0794   -0.2836    0.8069]

S_opt = [    -0.0274    0.2412    0.2759    0.7973    0.4632   -0.1217;
    0.1561    0.8654    0.3473   -0.2579   -0.1852    0.0726;
    0.0319   -0.3928    0.8571   -0.2145   -0.0015   -0.2531;
    0.1637    0.1134   -0.2064   -0.4377    0.6989   -0.4875;
    0.7160   -0.1572    0.0752   -0.0282    0.2884    0.6107;
    0.6591   -0.0333   -0.1426    0.2439   -0.4237   -0.5524]

% S_opt = [    0.8569   -0.0379   -0.2044   -0.4462    0.1456   -0.0472;
%     0.4769   -0.1899    0.1805    0.8352   -0.0176    0.0774;
%    -0.1098    0.0661   -0.0240    0.1315    0.9320   -0.3115;
%    -0.0325    0.0384   -0.0377   -0.0457    0.3151    0.9459;
%     0.0404    0.7138   -0.6346    0.2747   -0.1027   -0.0053;
%     0.1536    0.6687    0.7217   -0.0917    0.0027    0.0015]

S_opt = [0.6583    0.0264  ;
    0.7117    0.1823  ;
    0.1667   -0.1616  ;
   -0.0796    0.9229  ;
    0.1590   -0.2967   ;
   -0.0279   -0.0165   ]

modes=size(S_opt,2);

sigma=linspace(0,1,10);
for n=1:modes
    for i=1:length(sigma)

        L1=330;
        L2=150;
        L3=130;
        L4=75;
        
        % right part 
        a1= 225/180*pi + S_opt(4,n)*sigma(i);
        a2= 90/180*pi + S_opt(5,n)*sigma(i);
        a3= (-90+45)/180*pi + S_opt(6,n)*sigma(i);
%         a1= (225+90)/180*pi + S_opt(4,n)*sigma(i);
%         a2= (90+180)/180*pi + S_opt(5,n)*sigma(i);
%         a3= (-270-45)/180*pi + S_opt(6,n)*sigma(i);
        
        joint1= [L1/2,0];
        joint2= joint1 + [L2*cos(a1),L2*sin(a1)];
        joint3= joint2 + [L3*cos(a1+a2),L3*sin(a1+a2)];
        joint4= joint3 + [L4*cos(a1+a2+a3),L4*sin(a1+a2+a3)];
        
        %left part 
        a4=(225+90)/180*pi+ S_opt(3,n)*sigma(i);
        a5=(90+180)/180*pi+ S_opt(2,n)*sigma(i);
        a6=(-270-45)/180*pi+ S_opt(1,n)*sigma(i);
        
        joint5=[-L1/2,0];
        joint6= joint5+[L2*cos(a4),L2*sin(a4)];
        joint7= joint6+[L3*cos(a4+a5),L3*sin(a4+a5)];
        joint8= joint7+[L4*cos(a4+a5+a6),L4*sin(a4+a5+a6)];
        
        joints=[joint8;joint7;joint6;joint5 ;joint1;joint2;joint3;joint4];
        
        
        figure(n+2)
        % title('S goal')
        % 
        % subplot(2,2,n)
        title('Mode',num2str(n),'fontsize',21)
        grid on 
        xlim([-400,400])
        ylim([-300,0])
        hold on 
%          color=[1+sigma(i),1+sigma(i),1+sigma(i)]
          color=[1-sigma(i),1-sigma(i),1-sigma(i)]
        plot(joints(:,1),joints(:,2),'linewidth',2,'Color',color)
        scatter(joints(:,1),joints(:,2),10,color,'filled')
        daspect([1,1,1])
        %F=getframe(1);
    end
end

%     0.6762    - 0.3965    0.0861
%    - 0.4070    0.2543   - 0.1331
%    - 0.3480    0.1665    -0.0758
%    - 0.4335    0.8032    0.3227
%     0.2005    0.2626    0.4090
%    - 0.1669   - 0.1905    -0.8353



% 
% angle (S) radat
%     1.6417   -0.3539    2.4189
%     0.5816   -0.9313   -2.0885
%     0.8208    0.7277   -0.6269
%    -2.7717   -1.6310   -2.4820
%     0.0549    1.4554    0.4527
%     1.7433    2.9509   -1.2538

% abs(S)
%     0.7700    0.1739    0.2210
%     0.4644    0.0892    0.4886
%     0.3866    0.0345    0.1356
%     0.1059    0.1317    0.3834
%     0.1657    0.7082    0.4535
%     0.0584    0.6646    0.5843
