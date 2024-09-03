function A=assemble_stiff_matrix(N,Gauss_coefficient_reference,Gauss_point_reference,c,h,xmin)
% N表示在计算域下用步长划分得到的区间数目
% Gauss_coefficient_reference表示参考区间的Gauss权重
% Gauss_point_reference表示参考区间的Gauss节点
% 函数c(x)=exp(x)表示泊松方程的系数函数
% h为对上面计算范围的均匀步长
A=sparse(N+1,N+1);
for j=1:N+1
    if (j<=N)
        Gauss_local_min=xmin+(j-1)*h;
        Gauss_local_max=xmin+j*h;
        A(j+1,j)=-1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
    end
    if (j>=2)
        Gauss_local_min=xmin+(j-2)*h;
        Gauss_local_max=xmin+(j-1)*h;
        A(j-1,j)=-1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
    end
    if (j>=2&&j<=N)
        Gauss_local_min=xmin+(j-2)*h;
        Gauss_local_max=xmin+(j-1)*h;
        A(j,j)=1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
        Gauss_local_min=xmin+(j-1)*h;
        Gauss_local_max=xmin+j*h;
        A(j,j)=A(j,j)+1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
    end
end
 Gauss_local_min=xmin+(1-1)*h;
 Gauss_local_max=xmin+1*h;
 A(1,1)=1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
 Gauss_local_min=xmin+(N-1)*h;
 Gauss_local_max=xmin+N*h;
 A(N+1,N+1)=1/h^2*Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
end