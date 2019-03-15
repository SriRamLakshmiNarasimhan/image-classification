function [a1 z1 a2 z2 a3 z3 a4] = computeForwardPropogation(X, theta1, theta2, theta3, m)
	
	if(m==1)
		a1 = [ones(1, 1); X];
	else
		a1 = [ones(1, m); X'];
	endif
	
	z1 = theta1*a1;
	a2 = sigmoid(z1);
	a2 = [ones(1, m); a2];
	z2 = theta2*a2;
	a3 = sigmoid(z2);
	a3 = [ones(1, m); a3];
	z3 = theta3*a3;
	a4 = sigmoid(z3);
	
	endfunction