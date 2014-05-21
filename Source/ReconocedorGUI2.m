function varargout = ReconocedorGUI2(varargin)
% RECONOCEDORGUI2 MATLAB code for ReconocedorGUI2.fig
%      RECONOCEDORGUI2, by itself, creates a new RECONOCEDORGUI2 or raises the existing
%      singleton*.
%
%      H = RECONOCEDORGUI2 returns the handle to a new RECONOCEDORGUI2 or the handle to
%      the existing singleton*.
%
%      RECONOCEDORGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCEDORGUI2.M with the given input arguments.
%
%      RECONOCEDORGUI2('Property','Value',...) creates a new RECONOCEDORGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReconocedorGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReconocedorGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReconocedorGUI2

% Last Modified by GUIDE v2.5 19-May-2014 01:00:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReconocedorGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @ReconocedorGUI2_OutputFcn, ...
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


% --- Executes just before ReconocedorGUI2 is made visible.
function ReconocedorGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReconocedorGUI2 (see VARARGIN)

% Choose default command line output for ReconocedorGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReconocedorGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ReconocedorGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

puntos = 0;
%fondo=imread('pipes.png');
%imshow('pipes.png');
load('imagenes.mat');
background = axes('unit', 'normalized', 'position', [0 0 1 1]);
%fondo = imread('pipes.png');
imagesc(fondo);
set(background, 'handlevisibility', 'off', 'visible', 'off');
tam=300;
todos=3;
set(handles.text1,'String',0);
pause(2);
for k = 1 : 30
    valores=[0; 0; 0];
    cara2=0;sitio2=0;
    cara3=0;sitio3=0;
    sitio1=randi(3);
    cara1=randi(3);
    valores(sitio1)=evalua(cara1);
    cara=caras(cara1,tam);
    imagen=dibuja(fondo, cara, 80, sitio1*(1024/4)-tam/2);
    aux=randi(3);
    if k>10 && aux~=sitio1
    sitio2=aux;
    cara2=randi(3);
    valores(sitio2)=evalua(cara2);
    cara=caras(cara2,tam);
    imagen=dibuja(imagen, cara, 80, sitio2*(1024/4)-tam/2);
    end
    aux=randi(3);
    if k>20 && aux~=sitio1 && aux ~= sitio2
    sitio3=aux;
    cara3=randi(3);
    valores(sitio3)=evalua(cara3);
    cara=caras(cara3,tam);
    imagen=dibuja(imagen, cara, 80, sitio3*(1024/4)-tam/2);
    end
    %imagen(100:300-1,sitio*256:sitio*256+200-1,:)=cara(1:200,1:200,:);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(imagen);
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    patron = grabacionJ();
    s=comparacion(patron);
    imagen=fondo;
    if s==1 || s==2 || s==3
        puntos=puntos+valores(s);
        imagen=dibuja(imagen, explosiones(valores(s),tam),80,s*(1024/4)-tam/2);
        if(valores(s)==50)
            todos=todos+1;
        end
    elseif s==0
        puntos=puntos+length(find(valores==100))*-50;
    else
        if todos>0
            puntos=puntos+sum(valores);
            todos=todos-1;
            todos=todos+length(find(valores==50));
            imagen=dibuja(imagen, explosiones(valores(1),tam),80,1*(1024/4)-tam/2);
            imagen=dibuja(imagen, explosiones(valores(2),tam),80,2*(1024/4)-tam/2);
            imagen=dibuja(imagen, explosiones(valores(3),tam),80,3*(1024/4)-tam/2);
            %bomb=imread('bomb.png');
            bomb=imresize(bomb,[tam tam]);
            imagen=dibuja(imagen,bomb,100,(1024/2)-length(bomb)/2);
        else
            puntos=puntos+length(find(valores==100))*-50;
            s=0;
        end
    end
    ind=find(valores==100);
    if s~=4 && length(find(ind~=s))~=0
        %django=imread('django.png');
        %django=imresize(django,[tam tam]);
        imagen=dibuja(imagen,django,100,(1024/2)-length(django)/2);
    end
    ind=find(valores==-150);
    if length(find(ind==s))~=0 || (length(ind)~=0 && s==4)
        imagen=dibuja(imagen, caras(4,tam), 300,(1024/2)-tam/2);
    end
    if s==0
        imagen=dibuja(imagen, caras(5,tam), 300,(1024/2)-tam/2);
    end
    set(handles.text1,'String',puntos);
    set(handles.text3,'String',todos);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(imagen);
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    pause(2);
    
end
    %glidder=imread('glidder.png');
    %django=imread('django.png');
    imagen=dibuja(fondo,django,100,(1024/2)-length(django)/2);
    imagen=dibuja(imagen, glidder, 300,(1024/2)-tam/2);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(imagen);
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    set(handles.text1,'String',puntos);
    set(handles.text3,'String',todos)


function imagen=dibuja(fondo, cara, alto, inicio);
imagen=fondo;
for i=1:size(cara,1)
        for j=1:size(cara,2)
            if size(find(cara(i,j,:)==0))<3
                imagen(alto+i,inicio+j,:)=cara(i,j,:);
            end
        end
end
    
function v=evalua(cara)
    v=0;
    if cara==1
        v=100;
    elseif cara==2
        v=-150;
    elseif cara==3
        v=50;
    end
    
function s = comparacion(patron)
if patron~=-1
load('patrones.mat');
comparacion = [DTW(patron, patron1) DTW(patron, patron2) DTW(patron, patron3) DTW(patron, patron4)];
[valor, indice] = min(comparacion);
if valor < 300
    s = indice;
else
    s = 0;
end
else
    s= 0;
end


function patron = grabacionJ()
try
load('parametrosJuego.mat');
senal = grabacion(t * Fs, Fs, 1);
ppatron = preenfasis(senal, a);
segmentos = segmentacion(ppatron, n_muestras, despl);
segEnv = enventanado(segmentos, ventana);
[lz, lo] = inicio_fin(segEnv);
coeficientes = delta(cepstrum(segEnv(:, lz : lo), ceps + 1), p);
patron = normaliza(coeficientes);
catch err
    patron=-1;
end

function cara=caras(indice, tam)
load('imagenes.mat');
if(indice==1)
cara=montagon;
elseif(indice==2)
cara=jabi;
elseif(indice==3)
cara=paloma;
elseif(indice==4)
cara=sad;
else
cara=swhat;
end
cara = imresize(cara, [tam tam]);
function explo=explosiones(valor,tam)
load('imagenes.mat');
if(valor==-150)
    explo=cientocincuenta;
elseif(valor==50)
    explo=cincuenta;
elseif(valor==100)
    explo=cien;
else
    explo=explosion;
end
explo=imresize(explo, [tam tam]);
