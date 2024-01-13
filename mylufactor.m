function [x ]= mylufactor( A, b )
%This code will use lufactor method to solve the liner equations

  [n,m] = size(A);
  for i = 1:n
% Search for maximum in this column
% SHOULD BE A FAST MATLAB WAY TO GET MAX
    maxEl = abs(A(i,i));
    maxRow = i;
    for k = i+1: n
      if abs(A(k,i)) > maxEl
        maxEl = abs(A(k,i));
        maxRow = k;
      end
    end
 %Swap maximum row with current row (column by column)
    for k = i: n
      tmp = A(maxRow,k);
      A(maxRow,k) = A(i,k);
      A(i,k) = tmp;
    end
  end
%make P
  P = eye(n,m);
  PA = P* A;
%make L and U
  L = zeros(n,m);
  U = zeros(n,m);
  for j = 1:n
      %disp('j is')
      %disp(j)
    L(j,j) = 1.0;
    for i = 1:j
        %disp('tmp1 is')
        %disp(i)
        tmp1=0;
        for k = 1:i
            %disp('k is')
            %disp(tmp1)
            tmp1 = tmp1 + U(k,j)*L(i,k);
        end
        U(i,j) = PA(i,j) - tmp1;
    end
    for i =j: n
        tmp2=0;
        for k = 1:j
            %disp('tmp2 is')
            tmp2 = tmp2+U(k,j)*L(i,k);
        end
      L(i,j) = (PA(i,j) - tmp2)/U(j,j);
    end
  end
  L=L+P;
  %% now that we have A = LU 
  %%   Ax =b becomes  LUx =b  =>  Ly = b
  %% where first solve Ly=b for y then solve Ux =y for x
  y=gausselim(L,b);  %% CAUTION WE ARE CALLING OUR OTHER CODE HERE
  x=gausselim(U,y);  %% CAUTION WE ARE CALLING OUR OTHER CODE HERE
end

