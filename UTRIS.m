function x=UTRIS(U,b)
 [m,n] = size(U);

 for i=n:-1:1
    s = b(i);
    
    for k=i+1:n
        s = s - U(i,k)*x(k);
    end
    
    x(i) = s/U(i,i);
 
end
end