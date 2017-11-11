
function varargout = Comparar(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Comparar_OpeningFcn, ...
                   'gui_OutputFcn',  @Comparar_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Comparar is made visible.
function Comparar_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Comparar_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in BotonComprar.
function BotonComprar_Callback(hObject, eventdata, handles)
recta=get(handles.RectaMC,'Value');
parabola=get(handles.ParabolaMC,'Value');
exponencial=get(handles.Exponencial,'Value');
potencial=get(handles.Potencial,'Value');
hiperbola=get(handles.Hiperbola,'Value');
CompararAproximaciones(handles, recta, parabola, exponencial, potencial, hiperbola)


function headersAgregados = agregarHeader(headers, valor, nuevoHeader)
if (valor == 1)
    headersAgregados = [headers, nuevoHeader];
else
    headersAgregados = headers;
end

function headers = getTableHeaders(recta, parabola, exponencial, potencial, hiperbola)
headers = { 'Xn' 'f(Xn)' };
headers = agregarHeader(headers, recta, 'Modelo Recta MC');
headers = agregarHeader(headers, parabola, 'Modelo Parabola MC');
headers = agregarHeader(headers, exponencial, 'Modelo Exponencial');
headers = agregarHeader(headers, potencial, 'Modelo Potencial');
headers = agregarHeader(headers, hiperbola, 'Modelo Hiperbola');
headers = agregarHeader(headers, recta, 'Error Recta MC');
headers = agregarHeader(headers, parabola, 'Error Parabola MC');
headers = agregarHeader(headers, exponencial, 'Error Exponencial');
headers = agregarHeader(headers, potencial, 'Error Potencial');
headers = agregarHeader(headers, hiperbola, 'Error Hiperbola');

function CompararAproximaciones(handles, recta, parabola, exponencial, potencial, hiperbola)
    tableHeaders = getTableHeaders(recta, parabola, exponencial, potencial, hiperbola);
    set(handles.TablaComparacion,'ColumnName', tableHeaders);
    [data, mejorAproximacion] = getDatos(recta, parabola, exponencial, potencial, hiperbola);
    set(handles.TablaComparacion,'Data', data);
    set(handles.MejorAproximacion,'String', strcat('Mejor aproximacion: ', mejorAproximacion));


function datos = AgregarColumna(condicion, datosAnteriores, nuevaColumna)
    if (condicion == 0)
        datos = datosAnteriores;
    else
        datos = [datosAnteriores, nuevaColumna];
    end
    
function valoresRedondedados = redondearValores(valores)
    global const cantDecimales;
    valoresRedondedados = RedondearVector(valores, cantDecimales);
    valoresRedondedados = transpose(valoresRedondedados);


function [datos, mejorAproximacion] = getDatos(recta, parabola, exponencial, potencial, hiperbola)
global const cantDecimales;
global const matriz;
datos = RedondearMatrizDatos(matriz, cantDecimales);

[a, b, c] = getParametrosRecta(cantDecimales);
valoresRecta = HallarValores(matriz, a, b, c, 'a*x+b');
valoresRecta = redondearValores(valoresRecta);
datos = AgregarColumna(recta,datos,valoresRecta);

[a, b, c] = getParametrosParabola(cantDecimales);
valoresParabola = HallarValores(matriz, a, b, c, 'a*x^2 + b*x + c');
valoresParabola = redondearValores(valoresParabola);
datos = AgregarColumna(parabola,datos,valoresParabola);

[a, b, c] = getParametrosExponencial(cantDecimales);
valoresExponencial = HallarValores(matriz, a, b, c, 'b * exp(a*x)');
valoresExponencial = redondearValores(valoresExponencial);
datos = AgregarColumna(exponencial,datos, valoresExponencial);

[a, b, c] = getParametrosPotencial(cantDecimales);
valoresPotencial = HallarValores(matriz, a, b, c, 'b * (x^a)');
valoresPotencial = redondearValores(valoresPotencial);
datos = AgregarColumna(potencial,datos,valoresPotencial);

[a, b, c] = getParametrosHiperbolica(cantDecimales);
valoresHiperbolica = HallarValores(matriz, a, b, c, 'a / (x+b)');
valoresHiperbolica = redondearValores(valoresHiperbolica);
datos = AgregarColumna(hiperbola,datos,valoresHiperbolica);

[columna, errorRecta] = HallarErrores(matriz, valoresRecta);
datos = AgregarColumna(recta,datos,columna);

[columna, errorParabola] = HallarErrores(matriz, valoresParabola);
datos = AgregarColumna(parabola,datos,columna);

[columna, errorExponencial] = HallarErrores(matriz, valoresExponencial);
datos = AgregarColumna(exponencial,datos,columna);

[columna, errorPotencial] = HallarErrores(matriz, valoresPotencial);
datos = AgregarColumna(potencial,datos,columna);

[columna, errorHiperbolica] = HallarErrores(matriz, valoresHiperbolica);
datos = AgregarColumna(hiperbola,datos,columna);

aproximacionesUsadas = [recta, parabola, exponencial, potencial, hiperbola];
listadoErrores = [errorRecta, errorParabola, errorExponencial, errorPotencial, errorHiperbolica];
mejorAproximacion = getMejorAproximacion(aproximacionesUsadas, listadoErrores);

function aproximacion = getMejorAproximacion(aproximacionesUsadas, listadoErrores)
    listadoAproximaciones = {'Recta MC' 'Parabola MC' 'Aprox. Exponencial' 'Aprox. Potencial' 'Aprox. Hiperbolica'};
    aproximacion = 'Ninguna';
    minimoError = -1;
    for i=1:5
        if (aproximacionesUsadas(i) && (listadoErrores(i) < minimoError || minimoError == -1))
            minimoError = listadoErrores(i);
            aproximacion = listadoAproximaciones(i);
        end
    end
    
        
function [a, b, c] = getParametrosRecta(cantDecimales)
    global const matriz;
    c = 0;
    [a, b] = AproxRecta(matriz, cantDecimales);
    
function [a, b, c] = getParametrosParabola(cantDecimales)
    global const matriz;
    [a, b, c] = AproxParabola(matriz, cantDecimales);
    
function [a, b, c] = getParametrosExponencial(cantDecimales)
    global const matriz;
    c = 0;
    [a, b] = AproxExponencial(matriz, cantDecimales);

function [a, b, c] = getParametrosPotencial(cantDecimales)
    global const matriz;
    c = 0;
    [a, b] = AproxPotencial(matriz, cantDecimales);

function [a, b, c] = getParametrosHiperbolica(cantDecimales)
    global const matriz;
    c = 0;
    [a, b] = AproxHiperbolica(matriz, cantDecimales);
