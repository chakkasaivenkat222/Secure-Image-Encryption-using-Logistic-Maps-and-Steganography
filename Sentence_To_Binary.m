function binary_values = Sentence_To_Binary()
    % Prompt user to input a sentence
    sentence = input('Enter a sentence: ', 's');

    % Convert sentence to ASCII values
    ascii_values = double(sentence);

    % Convert ASCII values to binary
    binary_values = dec2bin(ascii_values,7);
    binary_array = reshape(binary_values.', 1, []);
    runLengthCoding(binary_array);
    
end

function runLengthCoding(input)
    maxi = 1;
    cnt = 1;
    for i = 2:length(input)
        if input(i) == input(i-1)
            cnt = cnt + 1;
        else
            maxi = max(cnt, maxi);
            cnt = 1;
        end
    end
    fprintf('Max consecutive count: %d\n', maxi);
    k = log(maxi) / log(10);
    k = k * 3.322;
    p = ceil(k);
    fprintf('Number of bits required: %d\n', p);
    fprintf('The Encoded Sequence is:\n');
    
    cnt_0 = 0;
    cnt_1 = 0;
    for i = 1:length(input)
        if input(i) == '0'
            if cnt_1 > 0
                fprintf('1');
                convertBinary(cnt_1, p);
                cnt_1 = 0;
            end
            cnt_0 = cnt_0 + 1;
        else
            if cnt_0 > 0
                fprintf('0');
                convertBinary(cnt_0, p);
                cnt_0 = 0;
            end
            cnt_1 = cnt_1 + 1;
        end
    end
    if cnt_1 > 0
        fprintf('1');
        convertBinary(cnt_1, p);
    end
    if cnt_0 > 0
        fprintf('0');
        convertBinary(cnt_0, p);
    end
    fprintf('\n');
end

function convertBinary(n, p)
    ans = '';
    while n > 0
        rem = mod(n, 2);
        if rem == 0
            ans = strcat(ans, '0');
        else
            ans = strcat(ans, '1');
        end
        n = floor(n / 2);
    end
    ans = fliplr(ans);
    while length(ans) < p
        ans = strcat('0', ans);
        p = p - 1;
    end
    fprintf('%s', ans);
end