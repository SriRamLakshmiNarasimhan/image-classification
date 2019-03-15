function predict(imageFilePath, map, theta1, theta2, theta3)

% default path
	if ~exist(imageFilePath)
		imageFilePath = "./tamil-data/test-input.png";
	endif
	
% convert image to vector form
	testX = convertImageToVector(imageFilePath);

% forward propogation algorithm
	[a1 z1 a2 z2 a3 z3 a4] = computeForwardPropogation(testX, theta1, theta2, theta3, 1);	
	[val index] = max(a4);
	predictedOutput = map(index);
	fprintf("\nPredicted output corresponds to index %d with probability %f.\n\n", index, val);
	output = [predictedOutput; val*100];
	
% modify path and save result in a file
% index.html file can show unicode characters if path is set
	save "C:/path/output.txt" output;
	
	endfunction