function [ x ] = gaussseidel( A, b, kmax, tol )
%This code will use gauss-seidel method to solve the liner equations
%Usage:gaussseidel(a,b,kmax(option),tol(option))

%Version 1.0
%The formula of Gauss seidel is obtained from
%https://en.wikipedia.org/wiki/Gauss%E2%80%93Seidel_method
if nargin < 2
   error('At least 2 input arguments required')  
end

if nargin < 3
    kmax=11;
end

if nargin < 4
    tol=1e-12;
end

L = tril(A);
U = A-L;
n=length(b);
%print L
%print U
%We make a initial guess of x(0) with all values are 0

xo=zeros(n,1);
x=xo;
x_prev=xo;
%print x
%Now we use formula x(k+1)=D^(-1)*(b-R*x(k)) to make the approach
for k = 1:kmax
  %print k, x
   x=L\(b-(U*x_prev));
   if abs(x-x_prev) < tol
     break
   end
   x_prev=x;
end

end

