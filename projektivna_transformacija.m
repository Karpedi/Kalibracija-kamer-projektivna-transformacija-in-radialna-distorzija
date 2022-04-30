function projektivna_transformacija(img) 
    figure('Name','Originalna siva slika'); clf;
    
    slika_cb = repmat(img, [1, 1, 3]);
    image(slika_cb);
    
    disp('Izberi 4 ogljisca sahovnice... -> Levi zgornji, levi spodnji, desni zgornji, desni spodnji');
    % oznaèimo štiri robove na sliki
    [xin, yin] = ginput(4);
    
    %Izraèunamo razdaljo med izbranimi toèkami - 3 in 1, 2 in 1, 4 in 2 ter
    %4 in 3
    razdalja = sqrt((xin(3)-xin(1))^2 + (yin(3)-yin(1))^2) + sqrt((xin(2)-xin(1))^2 + (yin(2)-yin(1))^2) + sqrt((xin(4)-xin(2))^2 + (yin(4)-yin(2))^2) + sqrt((xin(4)-xin(3))^2 + (yin(4)-yin(3))^2);
    % doloèimo, da je razdalja med vsako toèko enaka
    razdalja = razdalja / 4;
    % doloèimo veèdimenzionalne prostorsko oblikovane strukture
    % ('projective') = projekcijska 2D transformacija
    Tform = maketform('projective', [xin, yin], [xin(1), yin(1); xin(1), yin(1)+razdalja; xin(1)+razdalja, yin(1); xin(1)+razdalja, yin(1)+razdalja]);
    % transformiramo sliko img v skladu z 2D transformacijo Tform
    out = imtransform(img, Tform, 'XData', [1 size(img, 2)], 'YData', [1 size(img,1)]);
    
    % prikazi popravljeno sliko in oznaci tocke na sahovnici (13 x 13)
    figure('Name','Popravljena slika z oznacenimi tockami'); 
    clf; %clear current figure window
    out = repmat(out, [1, 1, 3]);
    image(out);
    hold on;
    for i=0:12
        for j=0:12
           % oznaèimo vseh trinajst toèk po obeh oseh
           plot(xin(1)+(i*(razdalja/12)),yin(1)+(j*(razdalja/12)),'ro') %oznaèi z rdeèimi krogci
        end
    end
    hold off;
    
    % prikazi originalno sliko z oznacenimi tockami na sahovnici (13 x 13)
    figure('Name','Originalna slika z oznacenimi tockami');
    clf; %clear current figure window
    image(slika_cb);
    hold on;
    for i=0:12
        for j=0:12
            % uporabimo inverzno transformacijo podane transformacije Tform
            [tocka_x, tocka_y] = tforminv(Tform, xin(1)+(i*(razdalja/12)), yin(1)+(j*(razdalja/12)));
            plot(tocka_x,tocka_y,'ro')  %oznaèi z rdeèimi krogci
        end
    end
    hold off;