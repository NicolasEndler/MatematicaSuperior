function [a, b] = AproxRecta(datos, cantDecimales)
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
    parametros=mldivide(A,C);
    a = parametros(1);
    b = parametros(2);
    a = RedondearNumero(a, cantDecimales);
    b = RedondearNumero(b, cantDecimales);
end

