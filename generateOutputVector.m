function [map outputVector yMultiClass] = generateOutputVector(ouputfile)
  y = getStringCell(ouputfile);
  m = length(y);
  outputVector = -1*ones(m, 1);
  
  classificationIndex = 1;
  map = cell(0, 1);
  for i = 1:m
    if(outputVector(i) == -1)
      for j = i:m   
        if((strcmp(y{i},y{j})==1))
          outputVector(j) = classificationIndex;
          endif      
        endfor
        map(end+1,1) = y{i};
        classificationIndex = classificationIndex +1;    
      endif
    endfor
    
    yMultiClass = zeros(m, length(map));
    
    for i = 1: length(map)
    yMultiClass((outputVector==i), i) = 1;
    endfor
endfunction