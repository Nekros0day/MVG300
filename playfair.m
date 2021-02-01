function q=playfair(text, key, crypt)  %lab 2.2
%text = 'HI DE TH EG OL DI NT HE TR EE ST UM P';
%key = 'PLAYFAIREXAMPLE';
%crypt = true;



alfabete = setdiff(upper('a':'z'),'Q');
key = unique(key,'stable');
keySurfix = setdiff(alfabete,key);
key = [key, keySurfix]

keyMatrix = transpose(reshape(key, [5,5]))  %Matrix of the key
    




if crypt % encrypting
    text = upper(text(isletter(text)))
    len=numel(text);
    i=2;
    while i<=len  %organize text and add "X" between duplicates or end of string
        if text(i) == text(i-1)
            text=insertAfter(text, i-1,"X") % insert X after position i-1
            i=i+1;                          % increse i to be on the right position and skip where X was put down
            len=numel(text);                % increse the size of number of elements for the loop
        end
        i=i+2;                              % only compare pairs

    end

    if rem(numel(text), 2) ~= 0
        text=strcat(text,'X') % insert X at the end if number of elements is odd
    end

    cryptoText = strings([1,numel(text)])
    i=2; %text(i) == text(i-1)
    while i <= numel(text)

        [row_1,col_1] = find(keyMatrix==text(i-1))  %find row and colum of matching letters
        [row_2,col_2] = find(keyMatrix==text(i))
                                                    
        
        if col_1 == col_2
            
            if row_1 == 5                           %Check rows and change acordingly to wrap around
                row_1=1;
                row_2=row_2+1;
            elseif row_2 == 5
                row_1=row_1+1;
                row_2=1;
            else
                row_1=row_1+1;
                row_2=row_2+1;
                
            end
            cryptoText(i-1) = keyMatrix(row_1,col_1);
            cryptoText(i) = keyMatrix(row_2,col_2);
            
        elseif row_1 == row_2
            
            if col_1 == 5                           %Check colums and change acordingly to wrap around
                col_1=1;
                col_2=col_2+1;
            elseif col_2 == 5
                col_1=col_1+1;
                col_2=1;
            else
                col_1=col_1+1;
                col_2=col_2+1;
            end
            cryptoText(i-1) = keyMatrix(row_1,col_1);
            cryptoText(i) = keyMatrix(row_2,col_2);

            
        else
            cryptoText(i-1) = keyMatrix(row_1,col_2);
            cryptoText(i) = keyMatrix(row_2,col_1);

            
        end
        i=i+2;                                      % only look at pairs
    end
    q=transpose(char(convertStringsToChars(cryptoText)));
    
else % decrypting
    text = upper(text(isletter(text)))
    decryptoText = strings([1,numel(text)])
    i=2; %text(i) == text(i-1)
    while i <= numel(text)

        [row_1,col_1] = find(keyMatrix==text(i-1))  %find row and colum of matching letters
        [row_2,col_2] = find(keyMatrix==text(i))
                                                    
        
        if col_1 == col_2
            
            if row_1 == 1                           %Check rows and change acordingly to wrap around
                row_1=5;
                row_2=row_2-1;
            elseif row_2 == 1
                row_1=row_1-1;
                row_2=5;
            else
                row_1=row_1-1;
                row_2=row_2-1;
                
            end
            decryptoText(i-1) = keyMatrix(row_1,col_1);
            decryptoText(i) = keyMatrix(row_2,col_2);
            
        elseif row_1 == row_2
            
            if col_1 == 1                           %Check colums and change acordingly to wrap around
                col_1=5;
                col_2=col_2-1;
            elseif col_2 == 1
                col_1=col_1-1;
                col_2=5;
            else
                col_1=col_1-1;
                col_2=col_2-1;
            end
            decryptoText(i-1) = keyMatrix(row_1,col_1);
            decryptoText(i) = keyMatrix(row_2,col_2);
            
        else
            decryptoText(i-1) = keyMatrix(row_1,col_2);
            decryptoText(i) = keyMatrix(row_2,col_1);
            
        end
        i=i+2;                                                              % only look at pairs
    end
    q=transpose(char(convertStringsToChars(decryptoText)));
    end
end
%IF DEBUGGING IS THE PROCESS OF REMOVING BUGS THEN PROGRAMMING MUST BE THE PROCESS OF PUTTING THEM IN EDSGER W DIJKSTRAX
