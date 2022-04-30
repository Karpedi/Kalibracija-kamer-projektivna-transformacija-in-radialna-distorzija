# Kalibracija-kamer-projektivna-transformacija-in-radialna-distorzija
Koncept kalibracije kamer s pomočjo toolboxa [Camera Calibration Toolbox za Matlab](http://www.vision.caltech.edu/bouguetj/calib_doc/)<br>
* Optično središče ( principal point) ocenjujemo, ker ga potrebujemo pri računanju ostalih lastnostih kamere. Ni vedno v središču slike, zaradi neprvilnosti pri izdelavi kamere(leč)<br>
* Goriščna razdalja ima enoto px. Ima dve komponentni, ker piksli niso kvadratni. Pretvorba v milimetrte sledi po naslednji formmuli:<br>**Fc(mm)=(Fc(px) x Sirina_senzorja)/Sirina_slike** <br>
* Elementi vektorja distorzije opisujejo popačenje slike. To so koeficienti modela popačenja
## Projektivna transformacija
* Kot edini parameter sprejme sivinsko sliko sahovnice.
* Sahovnico prikaze uporabniku, ta pa oznaci nekaj znacilnih tock.
Z uporabo ustreznih funkcij Matlabu izracuna parametre projektivne transformacije
med prikazano sliko, in idealno sliko, na kateri ni opaziti projektivnega popacenja.
* S pomocjo teh parametrov izvede transformacijo slike tako, da projektivno popacenje izgine,
ter sliko prikaze. Zatem prikaze se osnovno sliko, na kateri izrise oglisca vseh kvadratov, tudi
tistih, ki jih uporabnik ni podal.
## Radialna distorzija
Funkcija, ki oceni parameter radialnega popačenja.
