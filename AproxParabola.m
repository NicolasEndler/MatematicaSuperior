function [a, b, c] = AproxParabola(datos)
    % Parabola: y = a(x^2) + bx + c
    mat=transpose(datos);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        XY(i) = valx(i)*valy(i);
        x2(i) = valx(i)^2;
        x3(i) = valx(i)^3;
        x4(i) = valx(i)^4;
        X2Y(i) = x2(i)*valy(i);
    end   
    sumx=sum(valx);
    sumx2=sum(x2);
    sumx3=sum(x3);
    sumx4=sum(x4);
    sumy=sum(valy);
    sumXY=sum(XY);
    sumX2Y = sum(X2Y)
    A=[sumx4, sumx3, sumx2; sumx3, sumx2,sumx; sumx2,sumx,n];
    C=[sumX2Y;sumXY;sumy];
    b=mldivide(A,C);
    a = b(1);
    c = b(3);
    b = b(2);
end

