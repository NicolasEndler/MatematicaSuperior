function varargout = Menu(varargin)
% MENUMAIN MATLAB code for menumain.fig
%      MENUMAIN, by itself, creates a new MENUMAIN or raises the existing
%      singleton*.
%
%      H = MENUMAIN returns the handle to a new MENUMAIN or the handle to
%      the existing singleton*.
%
%      MENUMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENUMAIN.M with the given input arguments.
%
%      MENUMAIN('Property','Value',...) creates a new MENUMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools MenuMain.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menumain

% Last Modified by GUIDE v2.5 02-Nov-2017 22:42:15

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT
clc;
% Funciones propias------------------------------------------



% Fin funciones propias--------------------------------------
% --- Executes just before menumain is made visible.
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menumain (see VARARGIN)

% Choose default command line output for menumain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menumain wait for user response (see UIRESUME)
% uiwait(handles.MenuMain);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

MenuIngresarD
        

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Comparar.
function Comparar_Callback(hObject, eventdata, handles)
% hObject    handle to Comparar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Comparar

% --- Executes on button press in finalizar.
function finalizar_Callback(hObject, eventdata, handles)
% hObject    handle to finalizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Menu;

% --- Executes on button press in checkMostrarFunc.
function checkMostrarFunc_Callback(hObject, eventdata, handles)
% hObject    handle to checkMostrarFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkMostrarFunc


% --- Executes on button press in checkDetalleCalc.
function checkDetalleCalc_Callback(hObject, eventdata, handles)
% hObject    handle to checkDetalleCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkDetalleCalc


% --- Executes on button press in checkVisualizar.
function checkVisualizar_Callback(hObject, eventdata, handles)
% hObject    handle to checkVisualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkVisualizar


% --- Executes on selection change in ListaAproximaciones.
function ListaAproximaciones_Callback(hObject, eventdata, handles)
% hObject    handle to ListaAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ListaAproximaciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ListaAproximaciones



% --- Executes during object creation, after setting all properties.
function ListaAproximaciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListaAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Mostrar.
function Mostrar_Callback(hObject, eventdata, handles)
% hObject    handle to Mostrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matriz;

aprox=get(handles.ListaAproximaciones,'Value');
funcionAprox=get(handles.checkMostrarFunc,'Value');
detalleCalculo=get(handles.checkDetalleCalc,'Value');
visualizar=get(handles.checkVisualizar,'Value');

Mostrar(funcionAprox,detalleCalculo,visualizar,aprox);
