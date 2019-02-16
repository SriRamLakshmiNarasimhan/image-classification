function [X m] = readAllImagesFromDirectory(folderpath)
	
	m = 4*30;
	n = 400;
	X = zeros(m, n);
	ithData = 1;
	
	for i = 1:4
		for j = 1:30
			filename = strcat(int2str(i),'-',int2str(j),'.png');
			X(ithData, :) = convertImageToVector(strcat(folderpath, '/', filename));
			ithData = ithData +1;
			endfor
		endfor
	
	endfunction