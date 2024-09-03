function maxerror=get_maximum_error(result,exact,N,xmin,h)
maxerror=0;
for i=1:N+1
    temp=result(i)-exact(xmin+(i-1)*h);
    if abs(maxerror)<abs(temp)
        maxerror=temp;
    end
end
end