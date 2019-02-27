function x = cmmp (A,b)
[m,n]=size(A);
[A,u,beta]=tort_original(A);  
for k=1:n
    suma=0;
    for i=k:m
    suma=suma+u(i,k)*b(i);
    end
    tau=suma/beta(k);
    
    for i=k:m
        b(i)=b(i)-tau*u(i,k);
    end
end
x=UTRIS(A(1:n,:),b(1:n));
end