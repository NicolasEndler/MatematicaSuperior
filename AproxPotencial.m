function [a, b] = AproxPotencial(datos, cantDecimales)
    % Potencial: y = b(x^a)
    mat=transpose(datos);
    n=length(mat);
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        lnY(i) = log(valy(i));
        lnX(i) = log(valx(i));
        XY(i) = lnX(i)*lnY(i);
        x2(i) = lnX(i)^2;
    end   
    sumx=sum(lnX);
    sumLnY=sum(lnY);
    sumXY = sum(XY);
    sumX2 = sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; sumLnY];
    parametros=mldivide(A,C);
    a=parametros(1);
    b=exp(parametros(2));
    a = RedondearNumero(a, cantDecimales);
    b = RedondearNumero(b, cantDecimales);
end
