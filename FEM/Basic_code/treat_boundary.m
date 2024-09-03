function [A,b]=treat_boundary(A,b,N,lb,rb)
A(1,:)=0;
A(1,1)=1;
A(N+1,:)=0;
A(N+1,N+1)=1;
b(1)=lb;
b(N+1)=rb;
end