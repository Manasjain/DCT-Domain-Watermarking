clear all;
M=960;
N=120;
K=8;
A=imread('lena.jpg');
A=rgb2gray(A);
A=imresize(A,[960,960]);
b=imread('watermarked.jpg');
for p=1:N
    for q=1:N
        x=(p-1)*K+1;
        y=(q-1)*K+1;
        BLOCK1=A(x:x+K-1,y:y+K-1);
        BLOCK2=b(x:x+K-1,y:y+K-1);
        BLOCK1=idct2(BLOCK1);
        BLOCK2=idct2(BLOCK2);
            if BLOCK1(1,1)~=0
                a=(BLOCK2(1,1)/BLOCK1(1,1))-1;
                if a<0
                    W(p,q)=0;
                else
                    W(p,q)=1;
                end
            end
     end
end
subplot(2,2,1);
imshow(W);
title('the extracted watermark image');
imwrite(W,'w1.jpg','jpg');