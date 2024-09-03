% 程序设计思路
% 本程序是何晓明教授提到的case by case的代码范例；并不适合编写通用程序
% 由于这个程序只是case by case的代码范例，所以我们只考虑线性元的情况，并不去设置有限元类型参数
format short e
% 考虑问题的范围为 [xmin.xmax]
xmin=0;
xmax=1;

% 用的数值积分是Gauss型数值积分
Gauss_point_number=4;

h=1/4
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/8
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/16
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/32
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/64
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/128
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);

h=1/256
uh=poisson_solver_1D(xmin,xmax,h,Gauss_point_number);





