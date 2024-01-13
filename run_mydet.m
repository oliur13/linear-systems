%clean all before run
clear all
close all
clc

%%%%%%%%%%%%%%%%%
%define global variables
dimlist=[ 3 4 5 6 7  ];
%% providing a list for matrix dimensions allows you to 
%%  pickwhatever size matrix you want to test.

%% intialized data arrays
systimes = zeros(length(dimlist),1);
mytimes = zeros(length(dimlist),1);
squareerror = zeros(length(dimlist),1);


%%%%%%%%%%%%%%%%%%
%print result
runindex = 0;
for dim = dimlist
  runindex = runindex +1;
  a=mymat(dim);
  f=@() det(a);
  g=@() mydet(a);
  systimes(runindex) = timeit(f);
  mytimes(runindex) = timeit(g);
  soln =det(a);
  apprx = mydet(a);
  squareerror(runindex) = abs(soln-apprx);
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