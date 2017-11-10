function mat = RedondearMatrizDatos(matriz, cantDecimales)
    mat = transpose(matriz);
    matX = RedondearVector(mat(1:1, :), cantDecimales);
    matY = RedondearVector(mat(2:2, :), cantDecimales);
    mat = [transpose(matX),transpose(matY)];
end

