%%%  simple routine to calculate the determinant of a matrix
%%%%   by expanding across the first row.
%%%% a better solution might consider which row is the best row
function det = mydet(A)
%% help again
 [row,col ] = size(A);
 det = 0 ;
 if (row == 2) && (col ==2 ) 
        det = A(1,1)*A(2,2) - A(1,2)*A(2,1);
 else
      for i = 1:row
         %%% det  = det + (-1)^(i+1) * A(1,i)*mydet(minor(A,1,i));
         det = det + (-1)^(i+1) * A(1,i) * mydet( A( [2:end], [1:i-1 i+1:end]));
	 %%% this way completely avoids the call to function minor
      end
 end
end

