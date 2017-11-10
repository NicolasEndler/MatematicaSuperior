function valores = HallarValores(matriz, a, b, c, expresion);
    n=size(matriz, 1);
    for i=1:n
        x = matriz(i, 1);
        valores(i, 1) = eval(expresion);
    end
end

