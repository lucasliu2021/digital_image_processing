close all;
clear;
clc;
% ����ͼ�񱻸�˹������Ⱦ�����þ�ֵ�˲�
% ��ȡͼ��
rgb=imread('school3.jpg');
% ��ȡ����
fR=rgb(:,:,1);
fG=rgb(:,:,2);
fB=rgb(:,:,3);
% ��ֵ�˲�
w=fspecial('average');
fR_filtered=imfilter(fR,w);
fG_filtered=imfilter(fG,w);
fB_filtered=imfilter(fB,w);
rgb_filtered=cat(3,fR_filtered,fG_filtered,fB_filtered);
%��ʾ
figure,imshow('school3.jpg');
figure,imshow(rgb_filtered,[]);