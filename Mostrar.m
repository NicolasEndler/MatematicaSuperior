function varargout = Mostrar(varargin)
% MOSTRAR MATLAB code for Mostrar.fig
%      MOSTRAR, by itself, creates a new MOSTRAR or raises the existing
%      singleton*.
%
%      H = MOSTRAR returns the handle to a new MOSTRAR or the handle to
%      the existing singleton*.
%
%      MOSTRAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOSTRAR.M with the given input arguments.
%
%      MOSTRAR('Property','Value',...) creates a new MOSTRAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mostrar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mostrar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mostrar

% Last Modified by GUIDE v2.5 29-Oct-2017 19:52:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mostrar_OpeningFcn, ...
                   'gui_OutputFcn',  @Mostrar_OutputFcn, ...
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
%  funciones propias-------------------------------------------------

function mostrar(valor)

    if(valor==1)
%        agregar-----> funcion que muestre funcion aproximante 
    end


function detalle(valor)
     if(valor==1)
%        agregar-----> funcion que muestre fdetalle de calculo
    end


function visualizar(valor)
     if(valor==1)
%        agregar-----> funcion para visualizar distribucion de puntos
     end
  

function aproximar(valor)
    switch valor
        case 1
%             recta minimos cuad
        case 2
%             Parábola de MC
        case 3
%             Aprox. Exponencial
        case 4
%             Aprox. Potencial
        case 5
%             Aprox. Hipérbola
    end

% fin funciones

% --- Executes just before Mostrar is made visible.
function Mostrar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mostrar (see VARARGIN)

% Choose default command line output for Mostrar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mostrar wait for user response (see UIRESUME)
% uiwait(handles.figure1);

mostrar(varargin{1});
detalle(varargin{2});
visualizar(varargin{3});    
aproximar(varargin{4});

% --- Outputs from this function are returned to the command line.
function varargout = Mostrar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Mostrar
