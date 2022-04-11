close all;
clear;
clc;
%直观感受图像对比度较弱，细节看不清 ,使用彩色直方图均衡处理

rgb=imread('school1.jpg');rgb1=im2double(rgb);
r=rgb1(:,:,1);g=rgb1(:,:,2);b=rgb1(:,:,3);%%分别得到三色分量
I1=(r+g+b)/3; %%计算HSI彩色模型的I分量
tmp1=min(min(r,g),b);%计算RGB最小值
tmp2=r+g+b;
tmp2(tmp2==0)=eps;%避免除数为0
S=1-3.*tmp1./tmp2;
tmp1=0.5*((r-g)+(r-b));
tmp2=sqrt((r-g).^2+(r-b).*(g-b));
theta=acos(tmp1./(tmp2+eps));
H1=theta;
H1(b>g)=2*pi-H1(b>g);
H1=H1/(2*pi);
H1(S==0)=0;
I=histeq(I1);
hsi=cat(3,H1,S,I);
H=hsi(:,:,1)*2*pi;
S=hsi(:,:,2);
I=hsi(:,:,3);
R=zeros(size(hsi,1),size(hsi,2));
G=zeros(size(hsi,1),size(hsi,2));
B=zeros(size(hsi,1),size(hsi,2));
ind=find((H>=0)&(H<2*pi/3));
B(ind)=I(ind).*(1.0-S(ind));
R(ind)=I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind)));
G(ind)=3.0-(R(ind)+B(ind));


ind=find((H>2*pi/3)&(H<4*pi/3));

H(ind)=H(ind)-pi*2/3;
R(ind)=I(ind).*(1.0-S(ind));
G(ind)=I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind)));
B(ind)=3.0-(R(ind)+G(ind));

ind=find((H>=4*pi/3)&(H<2*pi));

H(ind)=H(ind)-pi*4/3;
G(ind)=I(ind).*(1.0-S(ind));
B(ind)=I(ind).*(1.0+S(ind).*cos(H(ind)./cos(pi/3.0-H(ind))));
R(ind)=3.0-(G(ind)+B(ind));
RGB=cat(3,R,G,B);
figure,imshow(H1);
figure,imshow(I1);
figure,imshow(I);
figure,imshow(S);
figure,imshow(rgb);
figure,imshow(RGB);

% 写入图像文件
