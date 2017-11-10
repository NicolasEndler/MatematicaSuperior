function [a, b] = AproxExponencial(datos)
    % Exponencial: y = b(e^(ax))
    mat=transpose(datos);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        lnY(i) = log(valy(i));
        XY(i) = valx(i)*lnY(i);
        x2(i) = valx(i)^2;
    end
    sumx=sum(valx);
    sumLnY=sum(lnY);
    sumXY = sum(XY);
    sumX2 =  sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; sumLnY];
    b=mldivide(A,C);
    a = b(1);
    b = exp(b(2));
end

