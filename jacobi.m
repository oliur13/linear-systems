function x = jacobi( A, b) 
%%  usage:  jacobi (A,b)
%%   A is a matrix and b is the rhs of Ax =b
%%    the solution x is returned:
  tol = 1e-12
  n =length(b);
  D = 1./diag(A);
  R = A-diag(diag(A));
  %We make a initial guess of xo with all values are 1
  xo=zeros(n,1);
  x= ones(n,1);
  %Now we use formula x(k+1)=D^(-1)*(b-R*x(k)) to make the approach
  maxiters = 11 ;
  for k =1:maxiters 
    x= D.*(b-(R*xo));
    if (max(abs(x-xo)) < tol)
        %%display("converged")
        break
    end
    xo = x;
  end
  %%% fprintf('Jacobie Log10(tol): %f Iter: %d size: %d\n', log10(max(abs(x-xo))),k,n);
end

