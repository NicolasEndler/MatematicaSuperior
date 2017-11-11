function varargout = Menu(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_OutputFcn, ...
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
clc;

function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)

MenuIngresarD


% --- Executes on button press in Comparar.
function Comparar_Callback(hObject, eventdata, handles)
global cantDecimales;
Comparar(cantDecimales)


% --- Executes during object creation, after setting all properties.
function ListaAproximaciones_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function finalizar_Callback(hObject, eventdata, handles)
 close Menu;

% --- Executes on button press in Mostrar.
function Mostrar_Callback(hObject, eventdata, handles)
global matriz;

aprox=get(handles.ListaAproximaciones,'Value');
funcionAprox=get(handles.checkMostrarFunc,'Value');
detalleCalculo=get(handles.checkDetalleCalc,'Value');
visualizar=get(handles.checkVisualizar,'Value');
global cantDecimales;

Mostrar(funcionAprox,detalleCalculo,visualizar,aprox,cantDecimales);
