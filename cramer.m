function [ x ] = cramer( a,b )
%cramer's method to solve a system of linear equations
%Usage:cramer(a,b)
%
%check the input
if nargin < 2
   error('At least 2 input arguments required')  
end
[rowA,colA] = size(a);
[rowB,colB] = size(b);
if (rowA ~= colA) 
   disp('ERROR: A is not a square matrix');
   return
end
if (colA ~= rowB )
    disp('ERROR: A and b are not compatible');
    return
end
%% check that size of a and b are as expected

%main iteration

  x = zeros(rowA,1);
  % compute and store the determinant
  % use matlab's det function
  detA = det(a);
  for i = 1:colA
    modA = a;
    % make the modified matrix
    modA(:,i) = transpose(b);
    % compute det using matlab's det function
    x(i) = det(modA)/detA;
  end

end

