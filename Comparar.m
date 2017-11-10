
function varargout = Comparar(varargin)
% COMPARAR MATLAB code for Comparar.fig
%      COMPARAR, by itself, creates a new COMPARAR or raises the existing
%      singleton*.
%
%      H = COMPARAR returns the handle to a new COMPARAR or the handle to
%      the existing singleton*.
%
%      COMPARAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARAR.M with the given input arguments.
%
%      COMPARAR('Property','Value',...) creates a new COMPARAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Comparar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Comparar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Comparar

% Last Modified by GUIDE v2.5 08-Nov-2017 23:30:01

% Begin initialization code - DO NOT EDIT 
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
global cantDecimales;
cantDecimales = varargin{1};
% End initialization code - DO NOT EDIT


% --- Executes just before Comparar is made visible.
function Comparar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Comparar (see VARARGIN)

% Choose default command line output for Comparar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Comparar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Comparar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in BotonComprar.
function BotonComprar_Callback(hObject, eventdata, handles)
% hObject    handle to BotonComprar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
    
function valores = getValores(matriz, a, b, c, expresion)
    global cantDecimales;
    n=size(matriz, 1);
    for i=1:n
        x = matriz(i, 1);
        valores(i, 1) = eval(expresion);
    end
    valores = RedondearVector(valores, cantDecimales);
    valores = transpose(valores);
    
function [valores, errorTotal] = getErrores(matriz, valoresAproximados)
    global cantDecimales;
    n=size(matriz, 1);
    errorTotal = 0;
    for i=1:n
        errorCuadratico = (valoresAproximados(i, 1) - matriz(i, 2))^2;
        errorTotal = errorTotal + errorCuadratico;
        valores(i, 1) = errorCuadratico;
    end
    valores = RedondearVector(valores, cantDecimales);
    valores = transpose(valores);

function [datos, mejorAproximacion] = getDatos(recta, parabola, exponencial, potencial, hiperbola)
global cantDecimales;
global const matriz;
datos = transpose(matriz);

datosRedondeadosX = RedondearVector(datos(1:1, :), cantDecimales);
datosRedondeadosY = RedondearVector(datos(2:2, :), cantDecimales);
datos = [transpose(datosRedondeadosX),transpose(datosRedondeadosY)];

[a, b, c] = getParametrosRecta(cantDecimales);
valoresRecta = getValores(matriz, a, b, c, 'a*x+b');
datos = AgregarColumna(recta,datos,valoresRecta);

[a, b, c] = getParametrosParabola(cantDecimales);
valoresParabola = getValores(matriz, a, b, c, 'a*x^2 + b*x + c');
datos = AgregarColumna(parabola,datos,valoresParabola);

[a, b, c] = getParametrosExponencial(cantDecimales);
valoresExponencial = getValores(matriz, a, b, c, 'b * exp(a*x)');
datos = AgregarColumna(exponencial,datos,valoresExponencial);

[a, b, c] = getParametrosPotencial(cantDecimales);
valoresPotencial = getValores(matriz, a, b, c, 'b * (x^a)');
datos = AgregarColumna(potencial,datos,valoresPotencial);

[a, b, c] = getParametrosHiperbolica(cantDecimales);
valoresHiperbolica = getValores(matriz, a, b, c, 'a / (x+b)');
datos = AgregarColumna(hiperbola,datos,valoresHiperbolica);

[columna, errorRecta] = getErrores(matriz, valoresRecta);
datos = AgregarColumna(recta,datos,columna);

[columna, errorParabola] = getErrores(matriz, valoresParabola);
datos = AgregarColumna(parabola,datos,columna);

[columna, errorExponencial] = getErrores(matriz, valoresExponencial);
datos = AgregarColumna(exponencial,datos,columna);

[columna, errorPotencial] = getErrores(matriz, valoresPotencial);
datos = AgregarColumna(potencial,datos,columna);

[columna, errorHiperbolica] = getErrores(matriz, valoresHiperbolica);
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
    

 


    

    
    
    

        
