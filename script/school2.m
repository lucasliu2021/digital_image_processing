close all;
clear;
clc;
% ����ͼ���д�������������������ֵ�˲�
rgb=imread('school2.jpg');
% ��ȡ����
fR=rgb(:,:,1);
fG=rgb(:,:,2);
fB=rgb(:,:,3);
% ��ֵ�˲�
fR_median=medfilt2(fR);
fG_median=medfilt2(fG);
fB_median=medfilt2(fB);
rgb_median=cat(3,fR_median,fG_median,fB_median);

%��ʾ
figure,imshow('school2.jpg');
figure,imshow(rgb_median,[]);