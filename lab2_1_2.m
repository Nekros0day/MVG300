function q=lab2_1_2(v, d)
longest = 1;
len = 1;                                    % remeber what the curent longest sqeuance is
endI = 1;
startI = 1;
for i = 2:numel(v)                         
        if v(i)== v(i-1) && v(i) == d       % if a match of 2 numbers in a sequence is dtected           
        len = len+1;                        % increase curent detected longest sequance is
        else
            len= 1;                         %if sequance is not meet reset
        end
        if len > longest
            longest = len;                  %if sequance is longer then the preveus stored one is then store the new one
            startI=i-len+1;                 % remeber the index of the sequance
            endI=i;
        end
end
    if v(1) ~= d & endI == 1
        disp('number does not exist in vector or doesnt have a sequence');
    else
        disp(longest)
        display([startI, endI])            % display the longest sequance if found
    end
q=([longest,startI, endI]);
end