%%teste contador de pessoas
clear all
close all
tic();
%%%Ler a frame que esta neste momento na camera
img1=imread('1.jpg');
img2=imread('2.jpg');
imgcropped1= imcrop(img1,[300 220 300 300]);

imgcropped2= imcrop(img2,[70 200 300 300]);
I1 = rgb2gray(imgcropped1);
I2 = rgb2gray(img2);
% Aplicar diferentes operadores de deteção de contornos

imgprewitt = edge(I1,'Prewitt','both');
imgclear=imclearborder(imgprewitt,6);
%Verificar componentes conectados('blobs') e retirar informações da imagem
cc = bwconncomp(imgclear);
%Retirar informação da Area de cada um dos 'blobs'
rp = regionprops(cc, 'Area','Orientation');
%Efetuar ação em cada um dos Objetos
for i = 1:cc.NumObjects 
    %Criar celula para armazenar objetos com area superior 5500
    objetos{i}= zeros(cc.ImageSize);
end
%Criar imagem vazia com o mesmo tamanho, para armazenar as Fichas/Objetos numa so imagem
imgvazia = zeros(cc.ImageSize);
%Efetuar ação em cada um dos Objetos
for i = 1:cc.NumObjects 
    %Verificar todas as fichas por area ,se area de algum objeto maior que 5500 é guardado na celula com o respetivo endereço (i)
    if ((rp(i).Area)>40 && (rp(i).Orientation)<-5)
    %Extrair Objetos/Fichas com area maior que 5500 e colocar o seu indice linear de pixeis a 1 na celula correspondente (i)    
    objetos{i}(cc.PixelIdxList{i}) = 1;
    %Verificar componentes conectados em cada um dos endereços (i) da celula('Cwhite')
    cc1 = bwconncomp(objetos{i});
    %Extrair em cada endereço (i) da celula('Cwhite'), se existir componentes conectados verificado na linha anterior, o indice linear de pixeis e colocar los a 1 juntando assim os objetos numa só imagem('imgwhite')
    imgvazia(cc1.PixelIdxList{1})=1;
    end
end
imshow(imgvazia);
       %img = snapshot(cam);
       %imgcropped= imcrop(img,[230 230 350 500]);
       %[bboxes,scores] = detect(detector,imgcropped);
       
       
       
       %img = insertObjectAnnotation(img,'rectangle',bboxes,scores);
       %imshow(img);title('Detected People and Detection Scores');
       
           %imshow(img);title('No people detected')
 toc();



