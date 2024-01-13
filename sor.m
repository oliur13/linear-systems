function [ x ] = sor( A,b,w,kmax,tol )
%This code will use successive over-relaxation method 
%to solve the liner equations
%Usage:sor(a,b,w(option),kmax(option),tol(option))

%Version 1.0
if nargin < 2
   error('At least 2 input arguments required')  
end

if nargin < 3
    w=1.5;
end

if nargin < 4
    kmax=11;
end

if nargin < 5
    tol=1e-12;
end

%main iteration
  [n,m]=size(A);
  D = zeros(n,m);
  for i = 1:n
    D(i,i)=A(i,i);
  end

  L = tril(A)-D;
  U = A-L-D;
%We make a initial guess of x(0) with all values are 0
  xo=zeros(n,1);
  x=xo;
  x_prev=xo;
%Now we use formula x(k+1)=D^(-1)*(b-R*x(k)) to make the approach
  tmp = D+w*L;
  for k = 1:kmax
    tmp1=(w*b)-(w*U+(w-1)*D) * x_prev;
    x = tmp\tmp1;
    if abs(x-x_prev)<tol
      break
    end
    x_prev=x;
  end

end

