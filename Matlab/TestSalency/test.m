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
            % Salency Map
            dirImg = strcat(dir,'/', data(4*cim+3,:) );
            img   = imread(dirImg);
            exImg = reflec(img);
            
            sm = saliencyMap(exImg,sigx,sigy);
            
            binImg = GMM(sm);
            rectS  = quart(binImg); 
            
            % Estudio
            sizeImg = str2num(data(4*cim+4,:));
            rectD   = str2num(data(4*cim+5,:));
            
            stadic      = study(rectD(1,:),rectS,sizeImg);
            vAUC(cim+1) = ROC(stadic);
        end % cim
        
        stdAUC(sigx,sigy)= std(vAUC);
        medAUC(sigx,sigy)=mean(vAUC);
    end % sigx
end % sigy
