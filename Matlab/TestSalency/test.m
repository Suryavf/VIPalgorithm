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

for sigx = 1:20
    for sigy = 1:20
        for cim = 0:many-1
            % Load data
            dirImg  = strcat(dir,'/', data(4*cim+3,:) );
            sizeImg = str2num(data(4*cim+4,:));
            
            img   = imread(dirImg);
            exImg = reflex(img);
            
            % Salency Map
            exSm = saliencyMap(exImg);
            exSm = imresize(exSm,4,'bilinear');
            sm   = iReflex(exSm,sizeImg);
            
            binImg = GMM(sm);
            rectS  = sqr(binImg); 
            
            % Estudio
            rectD   = str2num(data(4*cim+5,:));
            
            stadic      = study(rectD(1,:),rectS,sizeImg);
            vAUC(cim+1) = ROC(stadic);
        end % cim
        
        stdAUC(sigx,sigy)= std(vAUC);
        medAUC(sigx,sigy)=mean(vAUC);
    end % sigx
end % sigy
