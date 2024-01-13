%% dirver routine to run ALL of hte matrix solution methods

%%%%%%%%%%%%%%%%%
%clean all before run
clear all
close all
clc

%%%%%%%%%%%%%%%%%
%define global variables

dimlist = [  3:2:10 12 15 ];
%%dimlist = 2.^[14:14];
%%dimlist = [ 10:10:40]
numdims =  length(dimlist);

testfuncs = { @mydet };
testlabel =  "mydet" ;


numtests = length(testfuncs);
testtimes = zeros(numdims,numtests); 
testerror = zeros(numdims,numtests);

%%%%%%%%%%%%%%%%%%
%print result
icount = 0;
for dim = dimlist
  icount = icount+1;
  a = mymat(dim);
  ref = det(a);
  sol = mydet(a);
  fprintf('%3d of %3d : matrix: %d x %d : %d vs %d\n',icount, numdims,dim,dim,sol, ref);
end
% plot(dimlist,testerror,'DisplayName','testerror')
% legend(testlabel)
