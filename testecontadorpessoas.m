%%teste contador de pessoas
clear all
close all
%%%Ler a frame que esta neste momento na camera
cam = ipcam('http://213.193.89.202/mjpg/video.mjpg')
detector = peopleDetectorACF;
while true
tic();
       img = snapshot(cam);
       imgcropped= imcrop(img,[230 230 350 500]);
       [bboxes,scores] = detect(detector,imgcropped);
       
       
       
       img = insertObjectAnnotation(img,'rectangle',bboxes,scores);
       imshow(img);title('Detected People and Detection Scores');
       
           imshow(img);title('No people detected');
       
     toc();
end