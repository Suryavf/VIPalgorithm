%% Test Saliency Map
%  --
%  walk of life
%  --

clc
clear all
close all

path = '/home/victor/Documentos/Saliency/imageSetA/';
txt  = strcat(path,'Data/0_data.txt'); 
dir  = strcat(path,'Image');

data = caseread(txt);
many = str2num(data(1,:));

  vAUC = zeros(1,many);
stdAUC = zeros(20,20);
medAUC = zeros(20,20);

%for sigx = 1:20
%    for sigy = 1:20
        
%    end % sigx
%end % sigy

many
for cim = 0:many-1
    % Load data
    dirImg  = strcat(dir,'/', data(4*cim+3,:) );
    sizeImg = str2num(data(4*cim+4,:));

    img   = imread(dirImg);
    img   = check(img,sizeImg);
    exImg = reflex(img,sizeImg);

    % Salency Map
    exSm = saliencyMap(exImg);
    exSm = imresize(exSm,4,'bilinear');
    sm   = iReflex(exSm,sizeImg);

    sm = stand(sm);
    %binImg = GMM(sm);
    %rectS  = sqr(binImg);
 
    % Estudio
    rectD   = str2num(data(4*cim+5,:));

    stadic      = study(sm,rectD(3,:),sizeImg);
    vAUC(cim+1) = ROC(stadic);
    
    cim
end % cim

%stdAUC(sigx,sigy)= std(vAUC);
%medAUC(sigx,sigy)=mean(vAUC);

stdAUC = std(vAUC);
medAUC = mean(vAUC);