function [valores, errorTotal] = HallarErrores(matriz, valoresAproximados)
    n=size(matriz, 1);
    errorTotal = 0;
    for i=1:n
        errorCuadratico = (valoresAproximados(i, 1) - matriz(i, 2))^2;
        errorTotal = errorTotal + errorCuadratico;
        valores(i, 1) = errorCuadratico;
    end
end

