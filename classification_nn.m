clc; close all; clear all; 
fprintf('\n******************************************************************************************************\n');
fprintf('Beginning neural network training...\n\n');

% generate input matrix from training images
[X m] = readAllImagesFromDirectory("./tamil-data");

% generate corresponding output
[map y ymulti] = generateOutputVector("y.txt");

% shuffle the training data
randInt = randperm(m);
X = X(randInt, :);
y = y(randInt, :);
ymulti = ymulti(randInt, :);

	
% define neural network structure
inputLayerSize = 400; % each of our image is of size 20x20 pixels making it 400 units in input layer
hiddenLayer1Size = 600;
hiddenLayer2Size = 600;
outputLayerSize = 4; % determined by output, here we want to classify a, A, u and U

% initiaize some random weights
initTheta1 = initializeTheta(inputLayerSize, hiddenLayer1Size);
initTheta2 = initializeTheta(hiddenLayer1Size, hiddenLayer2Size);
initTheta3 = initializeTheta(hiddenLayer2Size, outputLayerSize);
weights = [initTheta1(:); initTheta2(:); initTheta3(:)];

% regularization parameter which determines 'underfitting' or 'overfitting' or just apt fitting
lambda = 1e-1;

costFunction = @(p) costFunction(p, inputLayerSize, hiddenLayer1Size, hiddenLayer2Size, outputLayerSize, X, ymulti, m, lambda);
options = optimset('GradObj', 'on', 'MaxIter', 200);
[optimalTheta fVal exitFlag] = fmincg(costFunction, weights, options);

%reshaping  theta 
[theta1 theta2 theta3] = reshapeVectorToMatrices(optimalTheta, inputLayerSize, hiddenLayer1Size, hiddenLayer2Size, outputLayerSize);

predictTrainingSetAccuracy(X, y, theta1, theta2, theta3, m);


fprintf("\n\nNeural network has been trained.\nTo predict, load image and execute predict(imageFilePath, map, theta1, theta2, theta3) in command line.\n");
fprintf('\n******************************************************************************************************\n');