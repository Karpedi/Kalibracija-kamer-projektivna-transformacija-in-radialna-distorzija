%% Vaja 2 - Kalibracija kamer, projektivna transformacija in radialna distorzija

%% 1 - Kalibracija kamere s toolboxom

calib_gui

% Vprašanja in odgovori 

% 1. Zakaj sploh ocenjujemo optièno središèe (principal point)? Zakaj ni vedno kar v središèu slike?
%  Ker ga potrebujemo pri raèunanju ostalih lastnosti kamere. Zaradi
%  nepravilnosti pri izdelavi kamere (leè)

% 2. V kakšnih enotah je podana gorišèna razdalja, zakaj ima dve komponenti, in kako bi jo preraèunali v milimetre?
% V px. Ker piksli niso kvadratni. Fc(mm) = (Fc(px)*sirina_senzorja)/sirina_slike

% 3. Kaj so elementi vektorja distorzije, ki jih izraèuna toolbox?
% Opisujejo popaèenje slike - koeficienti modela popaèenja

% 4. Kaj vam pokažeta Show extrinsic in Analyze error?
% Show extrinsic - pokaže relativne položaje mrež vseh petih obdelanih slik glede na kamero
% Analize error - s tem lahko vidimo katere toène pripadajo napakam na
% kateri sliki. Orodje je uporabno v primerih, kjer so koti slabo
% izlušèeni na eni ali veèih slikah...v takem primeru lahko kote ponovno
% izraèunamo z uporabo razliènih velikosti oken.

%% 2 - Projektivna transformacija - uporabimo izvožene podatke (brez radialne distorzije)

% Delovanje programa:
% - Kot edini parameter sprejme sivinsko sliko šahovnice
% - Šahovnico prikaže uporabniku, ta pa oznaèi nekaj znaèilnih toèk (premislite, katerih, in koliko). 
% Z uporabo ustreznih funkcij Matlabu izraèuna parametre projektivne transformacije
% med prikazano sliko, in idealno sliko, na kateri ni opaziti projektivnega popaèenja
% - S pomoèjo teh parametrov izvede transformacijo slike tako, da projektivno popaèenje izgine,
% ter sliko prikaže. Zatem prikaže še osnovno sliko, na kateri izriše oglišèa vseh kvadratov, tudi
% tistih, ki jih uporabnik ni podal (namig – uporabite inverzno transformacijo).


slika = imread('Image_rect2.tif');
projektivna_transformacija(slika) 


