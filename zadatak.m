% %prvi zadatak
% % Filtracija slike
% % 
% %     Učitati sliku po izboru
% %     Kreirati impulsni odziv visokopropusnog filtra (poglavlje 4.6.1 – Basic Highpass Filtering)
% %     Filtrirati sliku s dobivenim filtrom
% %     Prikazati dobivenu sliku
%

% Učitavanje i orikaz slike
image1 = imread('sprites.tif');
figure
colormap gray
imagesc(image1)
colorbar, axis equal, axis tight
title("Originalna slika")

% Napisati karakteristiku high-pass filtra kao matricu
h = 1/9 * [-1 -1 -1; -1 8 -1; -1 -1 -1];

%Filtrirati sliku filtrom
result1 = imfilter(image1, h, 'same');

%Prikaz filtrirane slike
figure
colormap gray
imagesc(result1)
colorbar, axis equal, axis tight
title("Slika filtrirana sa high pass filtrom")

% %drugi zadatak
% % Šum
% % 
% %     Učitati sliku po želji
% %     Originalnoj slici dodati Gaussov šum srednje vrijednosti 10 i varijance 0.1.
% %     Prikazati sliku sa šumom.
% %     Prikazati histogram a) orignalne slike, b) histogram šuma i c) histogram slike sa šumom.
% %     Odabrati neku od metoda za uklanjanje šuma i primjeniti je na zašumljenoj slici.
% 

%Varijable
%Očekivanje Gaussovog šuma
E=10.0
%Varijanca Gaussova šuma
V=0.1
%Stupanj filtra
N=2

%Učitavanje slike
image2 = imread('galaxy.tif');

%Konverzija u grayscale
image2=rgb2gray(image2);

%Prikaz slike
figure
colormap gray
imagesc(image2)
colorbar, axis equal, axis tight
title('Originalna slika');

%Dodavanje šuma slici
noise=imnoise(image2, 'gaussian', E/255, V/255);

%Prikaz ošumljene slike
figure
colormap gray
imagesc(noise)
colorbar, axis equal, axis tight
title('Slika sa dodanim Gaussovim šumom')

%Izrada matrice karakteristika low-pass filtra N-tog reda
h2=1/(N^2)*ones(N);

%Filtriranje slike filtrom h2
filtered = conv2(double(noise), h2, 'same');

%Prikaz filtrirane slike
figure
colormap gray
imagesc(filtered)
colorbar, axis equal, axis tight
title('Slika nakon filtriranja šuma')

%Ekstrakcija vrijednosti šuma iz slike
A=noise-image2;

%Prikaz histograma
figure
subplot(3,1,1)
hist(double(image2(:)), 50)
title('Histogram originalne slike')
xlabel('Vrijednost pixela slike')
ylabel('Broj pixela u binu')
xlim([0, 255])
subplot(3,1,2)
hist(double(A(:)), 35)
title('Histogram šuma dodanog slici')
xlabel('Amplituda šuma u slici')
ylabel('N')
subplot(3,1,3)
hist(double(noise(:)),50)
title('Histogram ošumljene slike')
xlim([0, 255])
xlabel('Vrijednost pixela slike')
ylabel('Broj pixela u binu')


% Detekcija rubova
% 
%     Odabrati jednu satelitsku snimku grada (npr. koristeći Google Maps)
%     Koristeći neku od metoda za detekciju rubova što bolje naglasiti ceste na slici
%     Sliku pretvoriti u crno-bijelu, ali uz pažljiv odabir rubne vrijednosti histograma tako da cesta ostane dobro naglašena
%     Po volji kombinirajući funkcije dilatacije i erozije dodatno naglasiti ceste na slici.

% image3=imread('city2.tif');
% figure
% imagesc(image3)
% image3=rgb2gray(image3);
% figure
% imagesc(image3)
% Gx = [-1 -2 -1; 0 0 0; 1 2 1]
% Gy = [-1 0 1; -2 0 2; -1 0 1]
% 
% Y=conv2(image3, Gx);
% Y=conv2(image3, Gy);
% 
% figure
% imagesc(Y)
% A=graythresh(Y);
% Y = Y > 200;
% figure
% imagesc(Y)
% 
% line=strel('line', 5, 90);
% line2=strel('line', 5, 0);
% Y = imdilate(Y, line);
% Y = imdilate(Y, line2);
% Y=imerode(Y, line);
% Y=imerode(Y, line2);
% 
% figure
% imagesc(Y)