function b=assemble_load_vector(N,Gauss_coefficient_reference,Gauss_point_reference,f,h,xmin)
b=zeros(N+1,1);
for i=2:N
    Gauss_local_xmin=xmin+(i-2)*h;
    Gauss_local_xmax=xmin+(i-1)*h;
    b(i)=1/h*Gauss_local_integral_vec(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax,f,1);
    Gauss_local_xmin=xmin+(i-1)*h;
    Gauss_local_xmax=xmin+i*h;
    b(i)=b(i)+1/h*Gauss_local_integral_vec(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax,f,-1);
end
Gauss_local_xmin=xmin+(1-1)*h;
Gauss_local_xmax=xmin+1*h;
b(1)=1/h*Gauss_local_integral_vec(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax,f,-1);
Gauss_local_xmin=xmin+(N-1)*h;
Gauss_local_xmax=xmin+N*h;
b(N+1)=1/h*Gauss_local_integral_vec(Gauss_coefficient_reference,Gauss_point_reference,Gauss_local_xmin,Gauss_local_xmax,f,1);
end