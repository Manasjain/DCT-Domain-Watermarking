clc;
clear all;
close all;
M=960;
N=120;
K=8;
I=zeros(M,M);
J=zeros(N,N);
BLOCK=zeros(K,K);
subplot(1,3,1);
I=imread('lena.jpg');
I=rgb2gray(I);
I=imresize(I,[960,960]);
imwrite(I,'source.jpg','jpg');
imshow(I);
title('lena image');

subplot(1,3,2);
J=imread('A.jpg');
J=im2bw(J,0.4);
J=imresize(J,[120,120]);
imwrite(J,'target.jpg','jpg');
imshow(J);
title('A');

for p=1:N
    for q=1:N
        x=(p-1)*K+1;
        y=(q-1)*K+1;
        BLOCK=I(x:x+K-1,y:y+K-1);
        BLOCK=dct2(BLOCK);
        if J(p,q)==0
            a=-1;
        else
            a=1;
        end
     %multiplicative watermarking algorithm factor
    BLOCK=BLOCK*(1+a*0.03);
    BLOCK=idct2(BLOCK);
    I(x:x+K-1,y:y+K-1)=BLOCK;
    end
end
subplot(1,3,3);
imshow(I);
title('watermark image');
imwrite(I,'watermarked.jpg','jpg');

