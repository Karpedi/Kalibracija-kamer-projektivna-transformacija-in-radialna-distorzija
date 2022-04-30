%% Vaja 2 - Kalibracija kamer, projektivna transformacija in radialna distorzija

%% 1 - Kalibracija kamere s toolboxom

calib_gui

% Vpra�anja in odgovori 

% 1. Zakaj sploh ocenjujemo opti�no sredi��e (principal point)? Zakaj ni vedno kar v sredi��u slike?
%  Ker ga potrebujemo pri ra�unanju ostalih lastnosti kamere. Zaradi
%  nepravilnosti pri izdelavi kamere (le�)

% 2. V kak�nih enotah je podana gori��na razdalja, zakaj ima dve komponenti, in kako bi jo prera�unali v milimetre?
% V px. Ker piksli niso kvadratni. Fc(mm) = (Fc(px)*sirina_senzorja)/sirina_slike

% 3. Kaj so elementi vektorja distorzije, ki jih izra�una toolbox?
% Opisujejo popa�enje slike - koeficienti modela popa�enja

% 4. Kaj vam poka�eta Show extrinsic in Analyze error?
% Show extrinsic - poka�e relativne polo�aje mre� vseh petih obdelanih slik glede na kamero
% Analize error - s tem lahko vidimo katere to�ne pripadajo napakam na
% kateri sliki. Orodje je uporabno v primerih, kjer so koti slabo
% izlu��eni na eni ali ve�ih slikah...v takem primeru lahko kote ponovno
% izra�unamo z uporabo razli�nih velikosti oken.

%% 2 - Projektivna transformacija - uporabimo izvo�ene podatke (brez radialne distorzije)

% Delovanje programa:
% - Kot edini parameter sprejme sivinsko sliko �ahovnice
% - �ahovnico prika�e uporabniku, ta pa ozna�i nekaj zna�ilnih to�k (premislite, katerih, in koliko). 
% Z uporabo ustreznih funkcij Matlabu izra�una parametre projektivne transformacije
% med prikazano sliko, in idealno sliko, na kateri ni opaziti projektivnega popa�enja
% - S pomo�jo teh parametrov izvede transformacijo slike tako, da projektivno popa�enje izgine,
% ter sliko prika�e. Zatem prika�e �e osnovno sliko, na kateri izri�e ogli��a vseh kvadratov, tudi
% tistih, ki jih uporabnik ni podal (namig � uporabite inverzno transformacijo).


slika = imread('Image_rect2.tif');
projektivna_transformacija(slika) 


