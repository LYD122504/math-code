function result=Gauss_local_integral_vec(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax,f,flag)
[Gauss_coefficient_local,Gauss_point_local]=generate_Gauss_local(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax);
Gpn=length(Gauss_point_local);
result=0;
if flag==1
    for i=1:Gpn
        result=result+Gauss_coefficient_local(i)*f(Gauss_point_local(i))*(Gauss_point_local(i)-Gauss_local_xmin);
    end
elseif flag==-1
    for i=1:Gpn
        result=result+Gauss_coefficient_local(i)*f(Gauss_point_local(i))*(Gauss_local_xmax-Gauss_point_local(i));
    end
end
end