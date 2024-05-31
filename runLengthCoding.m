function encoded_bit_stream=runLengthCoding(bit_stream)
    % STEP 1: Grouping bits as per successive occurrence
    groups = regexp(bit_stream, '0+|1+', 'match');
    % STEP 2: Arranging in the form (Bit Value, Number of Occurrence)
    encoded_output = '';
    for i = 1:length(groups)
        bit_value = groups{i}(1);
        num_occurrences = length(groups{i});
    end
    % STEP 3: Finding the length of occurrence in bits
    max_occurrence_length = ceil(log2(max(cellfun(@length, groups))));
    % STEP 4: Representing each occurrence value in its corresponding binary representation
    for i = 1:length(groups)
        bit_value = groups{i}(1);
        num_occurrences = length(groups{i});
        binary_representation = dec2bin(num_occurrences, max_occurrence_length);
        encoded_output = [encoded_output, bit_value, binary_representation];
    end
    % STEP 5: Encoded bit stream
    encoded_bit_stream = encoded_output;
    disp('Encoded bit stream:');
    disp(encoded_bit_stream);
end