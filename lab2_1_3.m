function q=lab2_1_3(v)
len = 1;
nOccur = zeros([1,10]);
for i = 2:numel(v)
        if v(i) == v(i-1)                      %if sequance is detected
        len = len+1;                           %remmeber sequance length
            if i == numel(v)                   %
                nOccur(len) = nOccur(len)+1;   %add sequance thats at the end
            end
        else
            nOccur(len) = nOccur(len)+1;       %if sequance breaks add 1 to the sequance lenght position in vector
            len= 1;                            %reset sequance
            if i == numel(v)
                nOccur(len) = nOccur(len)+1;   %add single sequance thats at the end 
                                               %as theres a number at the ends that broke the sequance
            end
        end
end

    for i=1:10
        disp([i,nOccur(i)])                    % Display number of each sequance lengths
    end
q=nOccur;
end