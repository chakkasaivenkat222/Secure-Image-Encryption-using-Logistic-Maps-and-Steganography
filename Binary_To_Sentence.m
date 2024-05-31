function sentence = Binary_To_Sentence(binary_data)
    % Reshape the binary data into 8-bit chunks
    binary_chunks = reshape(binary_data, 7, [])';

    % Convert binary chunks to decimal values
    decimal_values = bin2dec(binary_chunks);

    % Convert decimal values to ASCII characters
    sentence = char(decimal_values)';
end
