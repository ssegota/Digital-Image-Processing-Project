% %prvi zadatak
% % Filtracija slike
% % 
% %     Učitati sliku po izboru
% %     Kreirati impulsni odziv visokopropusnog filtra (poglavlje 4.6.1 – Basic Highpass Filtering)
% %     Filtrirati sliku s dobivenim filtrom
% %     Prikazati dobivenu sliku
% 
% image1 = imread('sprites.tif');
% figure
% colormap gray
% colorbar
% imagesc(image1)
% h = 1/9 * [-1 -1 -1; -1 8 -1; -1 -1 -1];
% result1 = imfilter(image1, h, 'same');
% figure
% colormap gray
% colorbar
% imagesc(result1)
% 
% %drugi zadatak
% % Šum
% % 
% %     Učitati sliku po želji
% %     Originalnoj slici dodati Gaussov šum srednje vrijednosti 10 i varijance 0.1.
% %     Prikazati sliku sa šumom.
% %     Prikazati histogram a) orignalne slike, b) histogram šuma i c) histogram slike sa šumom.
% %     Odabrati neku od metoda za uklanjanje šuma i primjeniti je na zašumljenoj slici.
% 
% image2 = imread('sprites.tif');
% figure
% colormap gray
% imagesc(image2)
% noise=imnoise(image2, 'gaussian', 10.0/255, 0.1/255);
% %image2=double(image2);
% 
% figure
% colormap gray
% imagesc(noise)
% X=1/9*ones(3);
% filtered = conv2(double(noise), X, 'same');
% figure
% colormap gray
% imagesc(filtered)
%  
% A=noise-image2;
% 
% figure
% subplot(3,1,1)
% hist(double(image2(:)), 50)
% subplot(3,1,2)
% hist(double(A(:)), 50)
% subplot(3,1,3)
% hist(double(noise(:)),50)

% Detekcija rubova
% 
%     Odabrati jednu satelitsku snimku grada (npr. koristeći Google Maps)
%     Koristeći neku od metoda za detekciju rubova što bolje naglasiti ceste na slici
%     Sliku pretvoriti u crno-bijelu, ali uz pažljiv odabir rubne vrijednosti histograma tako da cesta ostane dobro naglašena
%     Po volji kombinirajući funkcije dilatacije i erozije dodatno naglasiti ceste na slici.

image3=imread('city2.tif');
figure
imagesc(image3)
image3=rgb2gray(image3);
figure
imagesc(image3)
Gx = [-1 -2 -1; 0 0 0; 1 2 1]
Gy = [-1 0 1; -2 0 2; -1 0 1]

Y=conv2(image3, Gx);
Y=conv2(image3, Gy);

figure
imagesc(Y)
A=graythresh(Y);
Y = Y > 200;
figure
imagesc(Y)

line=strel('line', 5, 90);
line2=strel('line', 5, 0);
Y = imdilate(Y, line);
Y = imdilate(Y, line2);
Y=imerode(Y, line);
Y=imerode(Y, line2);

figure
imagesc(Y)