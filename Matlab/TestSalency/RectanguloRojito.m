function [ ImRect ] = RectanguloRojito( Imagen , rect )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[fii,cii;fsd,csd]=rect;
ImRect = Imagen;

ImRect(fsd:fii,cii,1)=255;
ImRect(fsd:fii,cii,2)=0;
ImRect(fsd:fii,cii,3)=0;

ImRect(fsd,cii:csd,1)=255;
ImRect(fsd,cii:csd,2)=0;
ImRect(fsd,cii:csd,3)=0;

ImRect(fsd:fii,csd,1)=255;
ImRect(fsd:fii,csd,2)=0;
ImRect(fsd:fii,csd,3)=0;

ImRect(fii,cii:csd,1)=255;
ImRect(fii,cii:csd,2)=0;
ImRect(fii,cii:csd,3)=0;

end

