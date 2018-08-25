img=imread('C:\Users\USER\Desktop\Fig0427(a)(woman).tif');
img=padarray(img,[100 100],'both');
fimg=fft2(img);
[x,y]=size(fimg);
g1=lpfilter('gaussian',x,y,1);
g10=lpfilter('gaussian',x,y,10);
g50=lpfilter('gaussian',x,y,50);
g100=lpfilter('gaussian',x,y,100);
freq1=fimg.*g1; result1=ifft2(freq1);
freq10=fimg.*g10; result10=ifft2(freq10);
freq50=fimg.*g50; result50=ifft2(freq50);
freq100=fimg.*g100; result100=ifft2(freq100);

figure('Name','With zero paddimg','NumberTitle','off');
subplot(2,2,1); imshow(result1,[]);
title('cutoff frequecy = 1');
subplot(2,2,2);imshow(result10,[]);
title('cutoff frequecy = 10');
subplot(2,2,3); imshow(result50,[]);
title('cutoff frequecy = 50');
subplot(2,2,4); imshow(result100,[]);
title('cutoff frequecy = 100');

function [U, V] = dftuv(M, N)
	u = 0:(M - 1);
	v = 0:(N - 1);
	idx = find(u > M/2);
	u(idx) = u(idx) - M;
	idy = find(v > N/2);
	v(idy) = v(idy) - N;
	[V, U] = meshgrid(v, u);
end

function H = lpfilter(type, M, N, D0, n)
[U, V] = dftuv(M, N);
D = sqrt(U.^2 + V.^2);
    switch type
        case 'ideal'
            H = double(D <=D0);
        case 'btw'
            if nargin == 4
                n = 1;
            end
            H = 1./(1 + (D./D0).^(2*n));
        case 'gaussian'
            H = exp(-(D.^2)./(2*(D0^2)));
        otherwise
            error('Unknown filter type.')
    end
end

