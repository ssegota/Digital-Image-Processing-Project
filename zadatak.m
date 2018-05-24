%prvi zadatak
image1 = imread('sprites.tif');
figure
colormap gray
colorbar
imagesc(image1)
h = 1/9 * [-1 -1 -1; -1 8 -1; -1 -1 -1]
result1 = imfilter(image1, h);
figure
colormap gray
colorbar
imagesc(result1)

%drugi zadatak
image2 = imread('galaxy.tif');
figure
imagesc(image2)
noise=imnoise(a, 'gaussian', 0, 1)