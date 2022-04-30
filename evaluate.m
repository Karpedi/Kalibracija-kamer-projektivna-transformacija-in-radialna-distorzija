function distortion = evaluate( f, center, corner, mid )

center=repmat(center,5,1);

% izraèun ob robu
%Izraèunamo razdaljo med toèko in izhodišèem
r_corner = corner - center;
% pretvorimo v polarne koordinate
[theta_corner,ro_corner] = cart2pol(r_corner(:,1),r_corner(:,2));
%izvedemo inverzno funkcijo
corner_polar = -f/2*(exp(-2*ro_corner/f)-1)./exp(-ro_corner/f);
% pretvorimo nazaj iz polarnih v karteziène koordinate
[X_corner, Y_corner] = pol2cart(theta_corner, corner_polar);
% x in y koordinate združimo v eno matriko
correct_corner =[X_corner,Y_corner];
% ponovno uporabimo funkcijo fitline (ocenimo odstopanje)
[C_corner, corner_distance] = fitline(correct_corner'); 
%minimiziramo odstopanje
distortion_corner = sum(corner_distance.^2); 


%enako naredimo še na sredini
%Izraèunamo razdaljo med toèko in izhodišèem
r_mid = mid - center;
% pretvorimo v polarne koordinate
[theta_mid,ro_mid] = cart2pol(r_mid(:,1),r_mid(:,2));
%izvedemo inverzno funkcijo
mid_polar =-f/2*(exp(-2*ro_mid/f)-1)./exp(-ro_mid/f);
% pretvorimo nazaj iz polarnih v karteziène koordinate
[X_mid,Y_mid] = pol2cart(theta_mid, mid_polar);
% x in y koordinate združimo v eno matriko
correct_mid =[X_mid,Y_mid];
% ponovno uporabimo funkcijo fitline (ocenimo odstopanje)
[C_mid, dist_mid] = fitline(correct_mid');
%minimiziramo odstopanje
distortion_mid = sum(dist_mid.^2);

%sestejemo vsote kvadratov
distortion = distortion_corner + distortion_mid;

