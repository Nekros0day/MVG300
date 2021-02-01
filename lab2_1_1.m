function q=lab2_1_1(v, d)
%Fråga: vad för inmatnings data?


    nOccur = zeros([1,10]);
    for f=1:d
        nOccur(v(f)+1) = nOccur(v(f)+1)+1 % add 1 to the coresponding number 0-9 (1-10) in vector
    end 


for i=1:10
    disp([i-1,nOccur(i)])
end
    q=nOccur;
end


