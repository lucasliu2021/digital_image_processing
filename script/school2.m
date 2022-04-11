close all;
clear;
clc;
% 看出图像有大量椒盐噪声，采用中值滤波
rgb=imread('school2.jpg');
% 获取分量
fR=rgb(:,:,1);
fG=rgb(:,:,2);
fB=rgb(:,:,3);
% 中值滤波
fR_median=medfilt2(fR);
fG_median=medfilt2(fG);
fB_median=medfilt2(fB);
rgb_median=cat(3,fR_median,fG_median,fB_median);

%显示
figure,imshow('school2.jpg');
figure,imshow(rgb_median,[]);