close all;
clear;
clc;
% 看出图像被高斯噪声污染，采用均值滤波
% 读取图像
rgb=imread('school3.jpg');
% 获取分量
fR=rgb(:,:,1);
fG=rgb(:,:,2);
fB=rgb(:,:,3);
% 均值滤波
w=fspecial('average');
fR_filtered=imfilter(fR,w);
fG_filtered=imfilter(fG,w);
fB_filtered=imfilter(fB,w);
rgb_filtered=cat(3,fR_filtered,fG_filtered,fB_filtered);
%显示
figure,imshow('school3.jpg');
figure,imshow(rgb_filtered,[]);