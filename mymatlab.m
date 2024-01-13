function [x ]= mymatlab( A, b )
[L,U] = lu(A);
y = linsolve(L,b);
x = linsolve(U,y);
end 