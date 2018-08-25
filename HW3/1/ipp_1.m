img=imread('C:\Users\USER\Desktop\Fig0427(a)(woman).tif');
fimg=fft2(img); 
figure;
subplot(1,2,1);imshow(abs(fimg),[]);
title('magnitude');
subplot(1,2,2);imshow(angle(fimg),[]);
title('phase');