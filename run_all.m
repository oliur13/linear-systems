%% dirver routine to run ALL of hte matrix solution methods

%%%%%%%%%%%%%%%%%
%clean all before run
clear all
close all
clc

%%%%%%%%%%%%%%%%%
%define global variables

dimlist = [ 10 20 50 100:50:300];
%%%%%%%%%%%%%%5
%%% pick resonable dimension for the matrix
%%%%%%%%%%%%%%%%%%5
numdims =  length(dimlist);

%%%%%%%%%%%%%%5
%%% update the list of methods and legends 
%%%%%%%%%%%%%%%%%%%%%%
testfuncs = { @gausselim @mylufactor @cramer @linsolve @jacobi @sor @gaussseidel };
testlabel = [   "gelim" , "lu", "cramer", "linsolve", "jacobi" ,"sor", "gside","n2","n3","n3+n2" ];

numtests = length(testfuncs);
testtimes = zeros(numdims,numtests); 
testerror = zeros(numdims,numtests);

%%%%%%%%%%%%%%%%%%
%print result
icount = 0;
for dim = dimlist
  icount = icount+1;
  a = mymat(dim);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  ref = rand(dim,1);
  b = a*ref;
  fprintf('%3d of %3d : matrix: %d x %d \n',icount, numdims,dim,dim);
  for thistest = 1:numtests
      tmp = @() testfuncs{thistest}(a,b);
      testtimes(icount,thistest) = log10(timeit(tmp));
      
      x = testfuncs{thistest}(a,b);
      squareerror(icount,thistest) = sqrt(dot((x-ref),(x-ref)))/dim;
      logerr = log10(squareerror(icount,thistest));
      testerror(icount,thistest) = logerr;
  end
 
  
end
%% 

figure();
plot(dimlist,testerror,"+-",'DisplayName','testerror','LineWidth',1.5)
legend(testlabel) 
xlabel("size matrix (n x n )")
ylabel("Log10(Err)")

figure();
hold on;
plot(dimlist,testtimes,"+-",'DisplayName','testtimes','LineWidth',1.5)
plot(dimlist,log10(dimlist.^2)-log10(dimlist(1).^2)+mean(testtimes(:,1)))
plot(dimlist,log10(dimlist.^3)-log10(dimlist(1).^3)+mean(testtimes(:,1)))
plot(dimlist,log10(dimlist.^3+dimlist.^2)-log10(dimlist(1).^3+dimlist.^2)+mean(testtimes(:,1)))
%plot(dimlist,log10(factorial(dimlist))-log10(factorial(dimlist(1)))+mean(testtimes(:,1)))
legend(testlabel)
xlabel("size matrix (n x n)")
ylabel("time(s)")
hold off;