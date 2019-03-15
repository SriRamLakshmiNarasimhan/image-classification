function [J grad] = costFunction(weights, inputLayerSize, hiddenLayer1Size, ...
	hiddenLayer2Size, outputLayerSize, X, yMatrix, m, lambda)

[theta1 theta2 theta3] = reshapeVectorToMatrices(weights, inputLayerSize, hiddenLayer1Size, hiddenLayer2Size, outputLayerSize);
	
theta1Grad = zeros(size(theta1));
theta2Grad = zeros(size(theta2));
theta3Grad = zeros(size(theta3));

% compute forward propogation
[a1 z1 a2 z2 a3 z3 a4] = computeForwardPropogation(X, theta1, theta2, theta3, m);


% compute cost
J = 0;
theta1sqsum = sum((theta1(:, 2:end).^2)(:));
theta2sqsum = sum((theta2(:, 2:end).^2)(:));
theta3sqsum = sum((theta3(:, 2:end).^2)(:));

J = (-1/m)*sum((yMatrix'.*log(a4) + (1-yMatrix').*log(1-a4))(:)) + ...
	(lambda/(2*m))*(theta1sqsum + theta2sqsum + theta3sqsum);

% compute back propogation
del4 = a4 - yMatrix';
del3 = theta3(:, 2:end)'*del4.*sigmoidGradient(z2);
del2 = theta2(:, 2:end)'*del3.*sigmoidGradient(z1);

% compute gradient
Del1 = (1/m)*del2*a1';
Del2 = (1/m)*del3*a2';
Del3 = (1/m)*del4*a3';

theta1Grad = Del1 + (lambda/m)*[zeros(size(theta1, 1), 1) theta1(:, 2:end)];
theta2Grad = Del2 + (lambda/m)*[zeros(size(theta2, 1), 1) theta2(:, 2:end)];
theta3Grad = Del3 + (lambda/m)*[zeros(size(theta3, 1), 1) theta3(:, 2:end)];
grad = [theta1Grad(:); theta2Grad(:); theta3Grad(:)];

end