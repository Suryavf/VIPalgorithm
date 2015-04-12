function ImRect = plotSQR( Imagen , rect )
%% plotSQR
%  
%  rect = [left top right bottom]

left   = rect(1); % Izquierda
top    = rect(2); % Arriba
right  = rect(3); % Derecha
bottom = rect(4); % Abajo

ImRect = Imagen;

color = [255 0 0];

ImRect(top:bottom, left,1) = color(1);
ImRect(top:bottom, left,2) = color(2);
ImRect(top:bottom, left,3) = color(3);

ImRect(top:bottom,right,1) = color(1);
ImRect(top:bottom,right,2) = color(2);
ImRect(top:bottom,right,3) = color(3);

ImRect(   top,left:right,1) = color(1);
ImRect(   top,left:right,2) = color(2);
ImRect(   top,left:right,3) = color(3);

ImRect(bottom,left:right,1) = color(1);
ImRect(bottom,left:right,2) = color(2);
ImRect(bottom,left:right,3) = color(3);

end