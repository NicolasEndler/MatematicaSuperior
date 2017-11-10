function numeroRedondeado = RedondearNumero(val, cantDecimales)
    if(cantDecimales > 0)
        valorDecimal = 10.^cantDecimales;
        valor = val*valorDecimal;
        valor = floor(valor);
        numeroRedondeado = valor./valorDecimal;
    else
        numeroRedondeado = floor(val);
    end
end

