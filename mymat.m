function mymat = mymat(N)
%% the following produces
%% positive definite matrix
   amp = 1;
   A = amp* rand(N);
   mymat = 1/2*(A + A') ;
  mymat = mymat + N*eye(N); 
   %% if you need strick diag dominance use bove
   %mymat = A*A';
end