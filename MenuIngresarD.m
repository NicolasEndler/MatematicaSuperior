function varargout = MenuIngresarD(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MenuIngresarD_OpeningFcn, ...
                   'gui_OutputFcn',  @MenuIngresarD_OutputFcn, ...
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


% --- Executes just before MenuIngresarD is made visible.
function MenuIngresarD_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = MenuIngresarD_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Agregar.
function Agregar_Callback(hObject, eventdata, handles)
x=get(handles.x,'String');
y=get(handles.y,'String');
x=str2double(x);
y=str2double(y);
datosAnteriores= get(handles.uitable2,'Data');
celda= {x y};
 if ( all(cellfun(@isempty,datosAnteriores(:))) )

     set(handles.uitable2,'Data',celda);

 else
      DatosNuevos=[datosAnteriores;celda];
      set(handles.uitable2,'Data',DatosNuevos);

 end
set(handles.x,'String','');
set(handles.y,'String','');
% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)

global matriz;
datosAnteriores= get(handles.uitable2,'Data');
matriz=cell2mat(datosAnteriores(:,:));
guidata(hObject,handles);
cd=get(handles.cantDecimales,'String');
cd=str2double(cd);
global cantDecimales;
cantDecimales = cd;
close MenuIngresarD;


% --- Executes during object creation, after setting all properties.
function cantDecimales_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
