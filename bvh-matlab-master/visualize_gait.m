close all
% Colmat = hsv();
name = '__walk_loop.bvh';
[skeleton,time] = loadbvh(name);

last = size(skeleton(1).Dxyz(3,:),2);
for nn = 10:12  
    Colour = [rand, rand, rand];
     plot(-skeleton(nn+1).Dxyz(3,:), skeleton(nn+1).Dxyz(2,:),'LineWidth',5, 'Color', Colour)
    hold on
    % Insert plot here!
    for ff = 1:last  
        plot([-skeleton(nn).Dxyz(3,ff) -skeleton(nn+1).Dxyz(3,ff)],...
        [skeleton(nn).Dxyz(2,ff) skeleton(nn+1).Dxyz(2,ff)], 'LineWidth', 1, 'Color', Colour)
        hold on
    end
end
figure()
for nn = 17:19
    Colour = [rand, rand, rand];
     plot(skeleton(nn+1).Dxyz(3,:), skeleton(nn+1).Dxyz(2,:),'LineWidth',5, 'Color', Colour)
    hold on
    % Insert plot here!
    for ff = 1:last
        plot([skeleton(nn).Dxyz(3,ff) skeleton(nn+1).Dxyz(3,ff)],...
        [skeleton(nn).Dxyz(2,ff) skeleton(nn+1).Dxyz(2,ff)], 'LineWidth', 1, 'Color', Colour)
        hold on
    end
end
figure()
for nn = 29:31
    Colour = [rand, rand, rand];
     plot(skeleton(nn+1).Dxyz(3,:), skeleton(nn+1).Dxyz(2,:),'LineWidth',5, 'Color', Colour)
    hold on
    % Insert plot here!
    for ff = 1:last  
        plot([skeleton(nn).Dxyz(3,ff) skeleton(nn+1).Dxyz(3,ff)],...
        [skeleton(nn).Dxyz(2,ff) skeleton(nn+1).Dxyz(2,ff)], 'LineWidth', 1, 'Color', Colour)
        hold on
    end
end
figure()
for nn = 36:38
    Colour = [rand, rand, rand];
     plot(skeleton(nn+1).Dxyz(3,:), skeleton(nn+1).Dxyz(2,:),'LineWidth',5, 'Color', Colour)
    hold on
    % Insert plot here!
    for ff = 1:last
        plot([skeleton(nn).Dxyz(3,ff) skeleton(nn+1).Dxyz(3,ff)],...
        [skeleton(nn).Dxyz(2,ff) skeleton(nn+1).Dxyz(2,ff)], 'LineWidth', 1, 'Color', Colour)
        hold on
    end
end
figure()
plot(skeleton(10).rxyz(3,:))
hold on
plot(skeleton(11).rxyz(3,:))
hold on
plot(skeleton(12).rxyz(3,:))
hold on
plot(skeleton(29).rxyz(3,:))
hold on
plot(skeleton(30).rxyz(3,:))
hold on
plot(skeleton(31).rxyz(3,:))
hold on
legend('1','2','3','4','5','6')
