d = dir('*.bmp');                   %Filter out everything exept .bmp filetypes
xtotal=0;
xmin=0;
xmax=0;
xcurrent=0;
for k = 1:length(d)                 %Go through all images
    [I, M] = imread(d(k).name);
    [rows, colums] = size(I);
    for i = 3:rows-2
        for j = 3:colums-2
                                    %check for green plus pattern
            if I(i,j) == 128 && I(i,j+1) == 128 && I(i,j-1) == 128 && I(i+1,j) == 128 && I(i-1,j) == 128 && I(i,j+2) == 128 && I(i,j-2) == 128 && I(i+2,j) == 128 && I(i-2,j) == 128
            xtotal=xtotal+1;        %total amount of x
            xcurrent=xcurrent+1;
            end
        end
        if k == 1                   %initial start value of minimal x 
            xmin=xtotal;
        end
    end
    if xcurrent >= xmax            % check if current amount of x in image is more then the last saved xmax
        xmax=xcurrent;
        xmaxName=d(k).name;
    end
    if xcurrent <= xmin             % check if current amount of x in image is less then the last saved xmin
        xmin=xcurrent;
        xminName=d(k).name;
    end
xcurrent=0;
end

%Display data
disp(['Total x: ', num2str(xtotal)])
disp(['Total Pictures: ', num2str(length(d))])
disp(['Average of x: ', num2str(xtotal/length(d))])
disp(['Min x: ', xminName,' | ', num2str(xmin)])
disp(['Max x: ', xmaxName,' | ', num2str(xmax)])
