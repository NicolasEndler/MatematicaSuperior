function varargout = MenuIngresarD(varargin)
% MENUINGRESARD MATLAB code for MenuIngresarD.fig
%      MENUINGRESARD, by itself, creates a new MENUINGRESARD or raises the existing
%      singleton*.
%
%      H = MENUINGRESARD returns the handle to a new MENUINGRESARD or the handle to
%      the existing singleton*.
%
%      MENUINGRESARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENUINGRESARD.M with the given input arguments.
%
%      MENUINGRESARD('Property','Value',...) creates a new MENUINGRESARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MenuIngresarD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MenuIngresarD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MenuIngresarD

% Last Modified by GUIDE v2.5 29-Oct-2017 17:40:11

% Begin initialization code - DO NOT EDIT
%DECLARACIONES----------------------------------------------


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
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MenuIngresarD (see VARARGIN)

% Choose default command line output for MenuIngresarD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MenuIngresarD wait for user response (see UIRESUME)
% uiwait(handles.MDatos);


% --- Outputs from this function are returned to the command line.
function varargout = MenuIngresarD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x as text
%        str2double(get(hObject,'String')) returns contents of x as a double


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y as text
%        str2double(get(hObject,'String')) returns contents of y as a double


% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Agregar.
function Agregar_Callback(hObject, eventdata, handles)
% hObject    handle to Agregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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

% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global matriz;
datosAnteriores= get(handles.uitable2,'Data');
% matriz=table2array(datosAnteriores);
matriz=datosAnteriores(:,:);
guidata(hObject,handles);

%  % get the handle of Gui1
%  h = findobj('Tag','MenuMain');
%  % if exists (not empty)
%  if ~isempty(h)
%     % get handles and other user-defined data associated to Gui1
%     g1data = guidata(h);
%     % maybe you want to set the text in Gui2 with that from Gui1
%     set(handles.matriz,'Array',get(g1data.edit1,'Array'));
%     % maybe you want to get some data that was saved to the Gui1 app
% %     x = getappdata(h,'x');
%  end

close MenuIngresarD;


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function cantDecimales_Callback(hObject, eventdata, handles)
% hObject    handle to cantDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cantDecimales as text
%        str2double(get(hObject,'String')) returns contents of cantDecimales as a double


% --- Executes during object creation, after setting all properties.
function cantDecimales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cantDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
