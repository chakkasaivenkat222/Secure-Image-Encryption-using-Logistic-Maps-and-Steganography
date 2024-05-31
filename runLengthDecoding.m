function runLengthDecoding(str, x)
    ans = '';
    ind = 1;
    n = length(str);
    while ind <= n
        dummy = str(ind+1:ind+x);
        val = bin_to_dec(dummy);
        for i = 1:val
            ans = strcat(ans, str(ind));
        end
        ind = ind + x + 1;
    end
    disp(ans);
end
function ans = bin_to_dec(str)
    ans=bin2dec(str);
end
