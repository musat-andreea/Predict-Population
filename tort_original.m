function [A,u,beta] = tort_original(A)
[m,n]=size(A);
p=min(m-1,n);
U=zeros(p,p);
beta = zeros(p);
u=zeros(p,p);
r=zeros(p,p);
for k=1:p
    sigma = sign(A(k,k))*sqrt(sum(A(k:m,k).*A(k:m,k)));
    if(sigma ==0)
        beta(k)=0;
    else
        U(k,k)=A(k,k)+sigma;
        u(k,k)=A(k,k)+sigma;
        for i=k+1:m
            U(i,k)=A(i,k);
            u(i,k)=A(i,k);
        end
        beta(k)=sigma*u(k,k);
        A(k,k)=-sigma;
        r(k,k)=-sigma;        
        for i=k+1:m
            A(i,k)=0;
        end
        for j=k+1:n
            tau=sum(u(k:m,k).*A(k:m,j))/beta(k);
            for i=k:m
                A(i,j)=A(i,j)-tau*u(i,k);
            end
        end
    end
end
end