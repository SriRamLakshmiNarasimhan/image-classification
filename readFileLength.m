function fileLength = readFileLength(filename)
  fid = fopen(filename);
  fileLength = 0;
    while(fgets(fid) > 0)
      fileLength = fileLength +1;
    endwhile
  fclose(fid);
	
  endfunction