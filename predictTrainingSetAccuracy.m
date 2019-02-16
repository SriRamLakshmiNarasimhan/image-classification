function predictTrainingSetAccuracy(X, y, theta1, theta2, theta3, m)
	
	[a1 z1 a2 z2 a3 z3 a4] = computeForwardPropogation(X, theta1, theta2, theta3, m);
	[val index] = max(a4);
	trainingSetAccuracy = mean(double(index'==y))*100;
	fprintf("\nTraining set accuracy is %f%%\n", trainingSetAccuracy);
	
	end