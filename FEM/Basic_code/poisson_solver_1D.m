function result=poisson_solver_1D(xmin,xmax,h,Gauss_point_number)
% 输入的参数含义如下：
% 考虑的计算范围为[xmin,xmax]
% h为对上面计算范围的均匀步长
% Gauss_point_number表示用Gauss型数值积分的节点数
% 程序中使用的参数含义如下：
% N表示在计算域下用步长划分得到的区间数目
% Gauss_coefficient_reference表示参考区间的Gauss权重
% Gauss_point_reference表示参考区间的Gauss节点
% 函数c(x)=exp(x)表示泊松方程的系数函数
% 函数f(x)=-exp(x)*(cos(x)-2*sin(x)-x*sin(x)-x*cos(x))表示泊松方程的右端函数
% 函数exp(x)=x*cos(x)表示方程的真解
% A为刚度矩阵，b为负载向量
% result表示有限元运算的结果
% maxerror表示误差的最大值
N=(xmax-xmin)/h;
[Gauss_coefficient_reference,Gauss_point_reference]=generate_Gauss_reference(Gauss_point_number);
c=@(x) exp(x);
f=@(x) -exp(x).*(cos(x)-2*sin(x)-x.*sin(x)-x.*cos(x));
exact=@(x) x.*cos(x);
lb=0;
rb=cos(1);
A=assemble_stiff_matrix(N,Gauss_coefficient_reference,Gauss_point_reference,c,h,xmin);
b=assemble_load_vector(N,Gauss_coefficient_reference,Gauss_point_reference,f,h,xmin);
[A,b]=treat_boundary(A,b,N,lb,rb);
result=A\b;
maxerror=get_maximum_error(result,exact,N,xmin,h);
maximum_error_at_all_nodes_of_FE=maxerror
end