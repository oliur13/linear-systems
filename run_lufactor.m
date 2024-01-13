%%lufactor Method
%This is a script to use lufactor method
%to solve linear equations
%The result will be printed and plotted

%%%%%%%%%%%%%%%%%
%clean all before run
clear all
close all
clc

%%%%%%%%%%%%%%%%%
%define global variables
dimlist=[ 3 4 5 6 7 ] ;
systimes = zeros(length(dimlist),1);
mytimes = zeros(length(dimlist),1);
squareerror = zeros(length(dimlist),1);

%%%%%%%%%%%%%%%%%%
%print result
runindex = 0;
for dim = dimlist
  runindex= runindex+1;
  a = rand(dim, dim);
  b = rand(dim,1);
  for i = 1:dim
      a(i,i)=a(i,i)*10+10;
  end
  f=@() linsolve(a,b);
  g=@() mylufactor(a,b);
  systimes(runindex) = timeit(f);
  mytimes(runindex) = timeit(g);
%   [P,L,U] = lufactor(a);
%   y=gausselim(L,b);
%   x=gausselim(U,y);
   x = mylufactor(a,b);
  ref = linsolve(a,b);
  squareerror(runindex) = dot((x-ref),(x-ref));
end

%%%%%%%%%%%%%%%%%%%%%%%
%make plots
figure(1)
subplot(211)
plot(dimlist,systimes,'bs-', dimlist, mytimes,'g^-')
title('performance')
xlabel('Dimension')
ylabel('Time(s)')

subplot(212)
plot(dimlist,log10(squareerror)/2,'bs-')
title('Square-Errors')
xlabel('Dimension')
ylabel('log(SquareError)')
