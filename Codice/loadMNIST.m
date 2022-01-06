function out = loadMNIST(filename1,filename2)
	%Caricamento del dataset MNIST
    fp = fopen(filename1, 'rb');
    assert(fp ~= -1, ['Could not open ', filename1, '']);
    magic = fread(fp, 1, 'int32', 0, 'ieee-be');
    assert(magic == 2051, ['Bad magic number in ', filename1, '']);
    numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
    numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
    numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
    images = fread(fp, inf, 'unsigned char');
    images = reshape(images, numCols, numRows, numImages);
    images = permute(images,[2 1 3]);
    fclose(fp);
    %Reshape to #pixels x #examples
    images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
    %Convert to double and rescale to [0,1]
     images = double(images) / 255;
    fp = fopen(filename2, 'rb');
    assert(fp ~= -1, ['Could not open ', filename2, '']);
    magic = fread(fp, 1, 'int32', 0, 'ieee-be');
    assert(magic == 2049, ['Bad magic number in ', filename2, '']);
    numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
    labels = fread(fp, inf, 'unsigned char');
    assert(size(labels,1) == numLabels, 'Mismatch in label count');
    fclose(fp);
    out.Images = images';
    out.Labels = labels;
end



