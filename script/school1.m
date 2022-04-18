clear
close all
clc
rgb=imread('school1.jpg') ;
subplot(1,2,1);imshow(rgb);title('原始图像')
rgb = im2double (rgb) ;
r=rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:, 3) ;
tmp1=0.5*((r-g)+(r-b));
tmp2=sqrt((r-g).^2+(r-b).*(g-b));
theta=acos(tmp1./(tmp2 + eps) ) ;
H = theta;
H(b>g)=2*pi-H(b>g);
H=H/ (2*pi) ;
tmp1 = min(min (r,g),b) ;
tmp2=r+g+b;
tmp2 (tmp2 == 0) = eps;
S = 1 - 3.* tmp1./ tmp2;
H(S==0)=0;
I =(r+g+b)/3;
hsi= cat(3, H, S, I) ;
hsi(:,:,3)=histeq(hsi(:,:,3));
H=hsi(:,:,1)*2*pi;
S=hsi(:,:,2);
I=hsi(:,:,3);
R = zeros(size(hsi,1),size(hsi,2));
G = zeros(size(hsi,1),size(hsi,2));
B = zeros(size(hsi,1),size(hsi,2));
ind=find((0<=H)&(H<2*pi/3));ss
B(ind)=I(ind).*(1-S(ind));
R(ind)=I(ind).*(1+S(ind).*cos(H(ind))./cos(pi/3-H(ind)));
G (ind) = 3*I(ind) -(R(ind)+B(ind));
ind = find( (2*pi/3 <= H) & (H < 4*pi/3));
R(ind)=I(ind).*(1-S(ind));
G(ind) = I (ind).* (1 + S(ind).*cos(H(ind)-2*pi/3)./cos (pi -H(ind)));
B(ind)=3*I(ind)-(R(ind)+G(ind));
ind=find((4*pi/3<=H)&(H<=2*pi));
G(ind)=I(ind).*(1-S(ind));
B(ind)=I(ind).*(1+S(ind).*cos(H(ind)-4*pi/3)./cos(5*pi/3-H(ind)));
R (ind) = 3*I (ind) - (G(ind) + B(ind) ) ;
RGB=uint8 (cat (3, R, G, B) *255) ;
subplot(1,2,2);imshow(RGB);title('新的图像')
imwrite(RGB,'change SCHOOL1.jpg');





