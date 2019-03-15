function imVectorForm = convertImageToVector(imageFilePath)
	
	pkg load image;
	image = imread(imageFilePath);
	% an rgb image is converted to gray scale and then converted to double 
	% a binary image (where 0 is black and 1 is white) is directly converted to double
	if(islogical(image) == 1)
		imVectorForm = im2double(image(:,:,1))(:);
		else
		imVectorForm = im2double(rgb2gray(image))(:);
		end;
	
	endfunction