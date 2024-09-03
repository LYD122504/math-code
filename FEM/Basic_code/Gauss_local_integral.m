function result=Gauss_local_integral(c,Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max)
[Gauss_coefficient_local,Gauss_point_local]=generate_Gauss_local(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_min,Gauss_local_max);
Gpn=length(Gauss_point_local);
result=0;
for i=1:Gpn
    result=result+Gauss_coefficient_local(i)*c(Gauss_point_local(i));
end
end