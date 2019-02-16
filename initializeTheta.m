function Theta = initializeTheta(inSize, outSize)
	
	epsilonInit = sqrt(6/(1+ outSize + inSize));
	Theta = (2*rand(outSize, 1+inSize) - 1)*epsilonInit;
	
	endfunction