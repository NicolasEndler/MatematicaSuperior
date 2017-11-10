function [a, b] = AproxRecta(datos)
    % Recta: y = ax +b
    mat=transpose(datos);
    n=length(mat);
%     obtengo los puntos en un vector x e y
    for i=1:n
        x(i)=mat(1,i);
        y(i)=mat(2,i);
    end
% realizo las sumatorias en una matriz cuadrada 2x2
    A=[sum(x.^2),sum(x);sum(x),n];
    C=[sum(x.*y);sum(y)];
%     obtengo b de Ab=C
    b=mldivide(A,C);
    a = b(1);
    b = b(2);
end

