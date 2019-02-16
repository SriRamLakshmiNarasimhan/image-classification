function [theta1 theta2 theta3] = reshapeVectorToMatrices(vector, inputLayerSize, ...
		hiddenLayer1Size, hiddenLayer2Size, outputLayerSize)
	
	theta1size = hiddenLayer1Size * (inputLayerSize + 1);
	theta2size = hiddenLayer2Size * (hiddenLayer1Size + 1);
	theta3size = outputLayerSize * (hiddenLayer2Size + 1);
	
	theta1 = reshape(vector(1:theta1size), hiddenLayer1Size, (inputLayerSize + 1));
	theta2 = reshape(vector((1 + theta1size): (theta1size + theta2size)), hiddenLayer2Size, (hiddenLayer1Size + 1));	
	theta3 = reshape(vector((1 + theta1size + theta2size): end), outputLayerSize, (hiddenLayer2Size + 1));
	
	end