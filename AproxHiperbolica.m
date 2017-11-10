function [a, b] = AproxHiperbolica(datos, cantDecimales)
    mat=transpose(datos);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        invy(i) = 1/valy(i);
        x2(i)=valx(i)^2;
    end
    XY = rdivide(valx,valy);
    sumx=sum(valx);
    suminvY=sum(invy);
    sumXY = sum(XY);
    sumX2 =  sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; suminvY];
    parametros=mldivide(A,C);
    
    a = 1/parametros(1);
    b = parametros(2)*a;
    a = RedondearNumero(a, cantDecimales);
    b = RedondearNumero(b, cantDecimales);
end
