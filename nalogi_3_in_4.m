%% 3 - Radialna distorzija

%Commonly seen on wide angle lenses, barrel distortion happens because
%the field of view of the lens is much wider than the size of the image sensor
%and hence it needs to be �squeezed� to fit. As a result, straight lines are visibly 
%curved inwards, especially towards the extreme edges of the frame.

% Potrebujemo funkciji fitline.m in normalise2dpts

clear all;
close all;

I = imread('Image15.tif');
I = repmat(I, [1,1,3]);
imshow(I);

%vzami robno linijo
disp('Izberi dva navpicna stolpca ogljisc (enega ob robu, drugega v sredi��u slike');
disp('Izberi ogli��a ob robu. Ko kon�a� pritisni ENTER');
[x_corner, y_corner] = ginput;
line1 = [x_corner y_corner];

figure(1)
n = size(x_corner) %zapi�emo velikost spremenljivke x_corner (x krat 1)
hold on;
    for a=1:n(1) %for zanka gre do vrednosti prve komponente velikosti spremenljivke x_corner
            plot(x_corner(a),y_corner(a),'ro') %ozna�i vse robne to�ke z rde�imi krogci
    end
hold on;

%vzemi sredinsko linijo
disp('Izberi ogli��a v sredi��u. Ko kon�a� pritisni ENTER');
[x_mid, y_mid] = ginput;
line2 = [x_mid y_mid];

n1 = size(x_mid) %zapi�emo velikost spremenljivke x_mid(x krat 1)
hold on;
  for a=1:n1(1) %for zanka gre do vrednosti prve komponente velikosti spremenljivke x_mid
            plot(x_mid(a),y_mid(a),'bo') %ozna�i vse sredinske to�ke z modrimi krogci
  end
hold off;

%dobimo odmik od premice za vsako to�ko (rde�i in modri kro�ci)
[C1, dist_c1] = fitline([x_corner y_corner]');
[C2, dist_c2] = fitline([x_mid y_mid]');

%izra�unamo faktor za�etnega popa�enja
distortion_line1 = sum(dist_c1.^2);
distortion_line2 = sum(dist_c2.^2);

%nekoregirano popa�enje
distortion = distortion_line1 + distortion_line2;

%izra�unamo sredi��e slike (zato da lahko premaknemo x in y v sredi��e koordinatnega sistema)
center = [240 320]

%kli�emo funkcijo za korekcijo distorzije
i=1;
for f=400:20:800
    correct_distortion(i)=evaluate(f,center,line1, line2);
    f_matrix(i) = f;
    i=i+1;
end

figure('Name','Vsota odstopanj za razli�ne vrednosti distorzije f - naloga 3')
[value, index] = min(correct_distortion); %poi��e vrednost in index najmanj�e vsote odstopanj
plot(f_matrix, correct_distortion); %izri�e graf
xlabel('Parameter distorzije f');
ylabel('Vsota odstopanj');
hold on
plot(f_matrix(index), value, ['x', 'red'], 'MarkerSize', 10); %izri�e kri�ec na mestu, kjer je najmanj�e odstopanje
disp(['Vrednost optimalnega parametra f je: ', num2str(f_matrix(index))]); %izpi�e vrednost parametra f
hold on




%% 4 - Dodatna naloga

% Napi�ite program, ki dolo�i optimalno vrednost parametra f s pomo�jo nelinearne optimizacije.
% Optimizacijo izvedite s pomo�jo Matlabove funkcije fminsearch

%izra�unamo vrednost f iz 3. naloge na podlagi indeksa (for zanka)
index_2 = 400+ (index * 20) - 20; 

%izra�unamo optimalno vrednost f s pomo�jo fminsearch funkcije in funkcije evaluate
f_minsearch=fminsearch(@(f) evaluate(f,center,line1, line2),index_2)

