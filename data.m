close all; clear all; clc; clf;

A = imread('Image_1373.jpg');
B = imread('Image_1374.jpg');
C = imread('Image_1375.jpg');

imshow(C)

[centers, radiiA, metric] = imfindcircles(A,[5 15]);
[centers, radiiB, metric] = imfindcircles(B,[5 15]);
[centers, radiiC, metric] = imfindcircles(C,[5 15]);

radii = [radiiA(); radiiB(); radiiC()];

ratio = 20 / 147.67; % um / pixel 

viscircles(centers, radiiC,'EdgeColor','b');
saveas(gcf, 'circles.png');

figure

hist(radii*ratio, 0.9:0.1:2.1)
set(get(gca,'child'),'FaceColor',[0.4 0.4 1],'EdgeColor','k');
title('Histogram of silica particle sizes')
ylabel('Particles')
xlabel('Radius [\mum]')
saveas(gcf, 'histogram.eps','epsc');

length(radii)
