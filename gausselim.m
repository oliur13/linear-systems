function [ x ] = gausselim( A,b )
%This code will use gausselimination method to solve the liner equations
%Usage:gausselim(a,b)
%The code is implemented from 
%https://www.mathworks.com/matlabcentral/answers/130593-hi-am-working-on-a-code-for-gaussian-elimination

%check the input
%%% IS THIS CHECK SUFFICIENT?
if nargin < 2
   error('At least 2 input arguments required')  
end

%forward elimination
n=length(b);
m=zeros(n,1);
x=zeros(n,1);
for k =1:n-1;
      %compute the kth column of M
      %%% CAUTION THERE IS NO CHECK THAT A(k,k) != 0.
      %% can you fix this?
      m(k+1:n) = A(k+1:n,k)/A(k,k);
      %% what do the following statements do?
      %% is this the best way to do this?
      for i=k+1:n
          A(i, k+1:n) = A(i,k+1:n)-m(i)*A(k,k+1:n);
      end;
      b(k+1:n)=b(k+1:n)-b(k)*m(k+1:n);
end
%% what does the following statement do?
U= triu(A);
% Backward substitution
  x(n)=b(n)/A(n,n);
 for k =n-1:-1:1;
      b(1:k)=b(1:k)-x(k+1)* U(1:k,k+1);
      x(k)=b(k)/U(k,k);
 end
end

%% CAN WE USE THIS TO ALSO CALC THE DETERMINANT?
%% what modifications do we have to make?

