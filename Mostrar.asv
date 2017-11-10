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
end

function mostrarAproximacion(tipo,cantDec)
        global const matriz;
        switch tipo
            case 1
                [a, b] = AproxRecta(matriz,cantDec);
                pol=strcat('$','Y =',num2str(a),'X^2','+',num2str(b),'X','$');
                handles = guidata(gcf);
                tx = title(pol,'interpreter','latex');
                tx.FontSize=15;
            case 2
                [a, b, c] = AproxParabola(matriz, cantDec);
                pol=strcat('$','Y =',num2str(a),'X^2','+',num2str(b),'X','+','(',num2str(c),')','$');
                handles = guidata(gcf);
                tx = title(pol,'interpreter','latex');
                tx.FontSize=15;
            case 3
                [a, b] = AproxExponencial(matriz,cantDec);
                pol=strcat('$','Y =',num2str(b),'e^','{',num2str(a),'X','}','$');
                handles = guidata(gcf);
                tx = title(pol,'interpreter','latex');
                tx.FontSize=15;
            case 4
                [a, b] = AproxPotencial(matriz,cantDec);
                pol=strcat('$','Y =',num2str(b),'X^','{',num2str(a),'}','$');
                handles = guidata(gcf);
                tx = title(pol,'interpreter','latex');
                tx.FontSize=15;

            case 5
%                 \frac{n!}{k!(n-k)!}
                [a, b] = AproxHiperbolica(matriz,cantDec);
                pol=strcat('$','Y =','\frac{',num2str(a),'}','{','X+','(',num2str(b),')','}','$');
                handles = guidata(gcf);
                tx = title(pol,'interpreter','latex');
                tx.FontSize=15;

        end
end
function mostrar(valor,tipo,cantDecimales)
    if(valor==1)
        mostrarAproximacion(tipo,cantDecimales);
    end

end
function detalle(valor)
     if(valor==1)
%        agregar-----> funcion que muestre fdetalle de calculo
    end

end

function graficar(conPuntos,vectorValores)

    if(conPuntos==1)
        plot(vectorValores{1},vectorValores{2},'*',vectorValores{3},vectorValores{4},'-b');
    else
        plot(vectorValores{3},vectorValores{4},'-b');
    end
end    

function hiperbolica(conPuntos)
  global const matriz;
    mat=transpose(matriz);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        invy(i) = 1/valy(i);
%         XY(i) = valx*invy;
        x2(i)=valx(i)^2;
    end
    XY = rdivide(valx,valy);
    sumx=sum(valx);
    suminvY=sum(invy);
    sumXY = sum(XY);
    sumX2 =  sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; suminvY];
    b=mldivide(A,C);
    maximoX=max(valx);
    minimoX=min(valx);
    x=minimoX-2:maximoX+2;
    valA = 1/b(1);
    valB = b(2)*valA;
%     y=valA/(x+valB);
    y=rdivide(valA,(x+valB));
    v={valx,valy,x,y};
    graficar(conPuntos,v);
%     plot(valx,valy,'*',x,y,'-b');
end
function parabolica(conPuntos)
    global const matriz;
    mat=transpose(matriz);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        XY(i) = valx(i)*valy(i);
        x2(i) = valx(i)^2;
        x3(i) = valx(i)^3;
        x4(i) = valx(i)^4;
        X2Y(i) = x2(i)*valy(i);
    end   
    sumx=sum(valx);
    sumx2=sum(x2);
    sumx3=sum(x3);
    sumx4=sum(x4);
    sumy=sum(valy);
    sumXY=sum(XY);
    sumX2Y = sum(X2Y);
    A=[sumx4, sumx3, sumx2; sumx3, sumx2,sumx; sumx2,sumx,n];
    C=[sumX2Y;sumXY;sumy];
    b=mldivide(A,C);
    maximoX=max(valx);
    minimoX=min(valx);
    x=minimoX-2:maximoX+2;
    y=b(1)*x.^2+b(2)*x+b(3);
%     plot(valx,valy,'*',x,y,'-b');
    v={valx,valy,x,y};
    graficar(conPuntos,v);

end    
function potencial(conPuntos)
       global const matriz;
    mat=transpose(matriz);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        lnY(i) = log(valy(i));
        lnX(i) = log(valx(i));
        XY(i) = lnX(i)*lnY(i);
        x2(i) = lnX(i)^2;
    end   
    sumx=sum(lnX);
    sumLnY=sum(lnY);
    sumXY = sum(XY);
    sumX2 =  sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; sumLnY];
    b=mldivide(A,C);
    maximoX=max(valx);
    minimoX=min(valx);
    x=minimoX-2:maximoX+2;
    valb=exp(b(2));
    vala=b(1);
    y=valb*(x.^(vala));
%     plot(valx,valy,'*',x,y,'-b');
    v={valx,valy,x,y};
    graficar(conPuntos,v);
end
function exponencial(conPuntos)
     global const matriz;
    mat=transpose(matriz);
    n=length(mat);
    
    for i=1:n
        valx(i)=mat(1,i);
        valy(i)=mat(2,i);
        lnY(i) = log(valy(i));
        XY(i) = valx(i)*lnY(i);
        x2(i) = valx(i)^2;
    end
    sumx=sum(valx);
    sumLnY=sum(lnY);
    sumXY = sum(XY);
    sumX2 =  sum(x2);
    A=[sumX2, sumx; sumx,n ];
    C=[sumXY; sumLnY];
    b=mldivide(A,C);
    maximoX=max(valx);
    minimoX=min(valx);
    x=minimoX-2:maximoX+2;
    valB = exp(b(2));
    y=valB*exp(x*b(1));
%     plot(valx,valy,'*',x,y,'-b');
    v={valx,valy,x,y};
    graficar(conPuntos,v);
end    
function rectaMC(conPuntos)
    global const matriz;
    mat=transpose(matriz);
    n=length(mat);
%     obtengo los puntos en un vector x e y
    for i=1:n
        x(i)=mat(1,i);
        y(i)=mat(2,i);
    end
% realizo las sumatorias en una matriz cuadrada 2x2
    A=[sum(x.^2),sum(x);sum(x),n];
    C=[sum(x.*y);sum(y)];
%     obtengo b de Ab=C
    b=mldivide(A,C);
%     calculo maximo y minimo valor de los puntos ingresados para ajustar
    Xmax=max(x);
    Xmin=min(x);
    x1=Xmin-2:Xmax+2;
%     el grafico
    y1 = (b(1)*x1)+b(2)
%     grafico: los puntos (x,y) y la recta 
    v={x,y,x1,y1};
    graficar(conPuntos,v);
end
function aproximar(valor,conPuntos)
    switch valor
        case 1
            rectaMC(conPuntos)
        case 2
             parabolica(conPuntos)
        case 3
             exponencial(conPuntos)
        case 4
            potencial(conPuntos)
        case 5
            hiperbolica(conPuntos)
    end

% fin funciones
end
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

detalle(varargin{2}); 
aproximar(varargin{4},varargin{3});
mostrar(varargin{1},varargin{4},varargin{5});
end
% --- Outputs from this function are returned to the command line.
function varargout = Mostrar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close Mostrar
end
