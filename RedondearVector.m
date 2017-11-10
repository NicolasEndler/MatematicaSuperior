function vectorRedondeado = RedondearVector(vector, cantDecimales)
    n=length(vector);
    for i=1:n
        val = vector(i);
        vectorRedondeado(i) = RedondearNumero(val, cantDecimales);
    end
end

