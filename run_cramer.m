%%%%%%%%%%%%%%%%%
%clean all before run
clear all
close all
clc

%%%%%%%%%%%%%%%%%
%define global variables
%%dimlist = 10:10:50;
dimlist=[3:10 100:50:300];
systimes = zeros(length(dimlist),1);
mytimes = zeros(length(dimlist),1);
squareerror = zeros(length(dimlist),1);

%%%%%%%%%%%%%%%%%%
%print result
runindex = 0;
for dim = dimlist
  runindex = runindex +1;
  %a = rand(dim, dim);
  %a =a'*a;
  a=mymat(dim);
  ref = rand(dim,1);
  b = a * ref; 
  f=@() linsolve(a,b);
  g=@() cramer(a,b);
  systimes(runindex) = timeit(f);
  mytimes(runindex) = timeit(g);
  x = cramer(a,b);
  %%ref = linsolve(a,b);
  squareerror(runindex) = dot((x-ref),(x-ref))/dim;
  disp("Dimesion: "); disp(dim);
end

%%%%%%%%%%%%%%%%%%%%%%%
%make plots
figure(1)
subplot(211)
plot(dimlist,systimes,'bs-', dimlist, mytimes,'g^-')
title('performance')
xlabel('Dimension')
ylabel('Time(s)')
legend('matlab','my code')

subplot(212)
plot(dimlist,log10(squareerror)/2,'bs-')
title('Square-Errors')
xlabel('Dimension')
ylabel('log10(SquareError)')
