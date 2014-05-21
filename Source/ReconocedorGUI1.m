function varargout = ReconocedorGUI1(varargin)
% RECONOCEDORGUI1 MATLAB code for ReconocedorGUI1.fig
%      RECONOCEDORGUI1, by itself, creates a new RECONOCEDORGUI1 or raises the existing
%      singleton*.
%
%      H = RECONOCEDORGUI1 returns the handle to a new RECONOCEDORGUI1 or the handle to
%      the existing singleton*.
%
%      RECONOCEDORGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCEDORGUI1.M with the given input arguments.
%
%      RECONOCEDORGUI1('Property','Value',...) creates a new RECONOCEDORGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReconocedorGUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReconocedorGUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".le schedule and post an out-of-band explanation.
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReconocedorGUI1

% Last Modified by GUIDE v2.5 20-May-2014 16:21:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReconocedorGUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @ReconocedorGUI1_OutputFcn, ...
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


% --- Executes just before ReconocedorGUI1 is made visible.
function ReconocedorGUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReconocedorGUI1 (see VARARGIN)

% Choose default command line output for ReconocedorGUI1
handles.output = hObject;

% UIWAIT makes ReconocedorGUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc
whitebg('k')
load('imagenes.mat');
imagenJuego = glidder;
imagenJuego = imresize(imagenJuego, [120 120]);
set(handles.botonJuego, 'CData', imagenJuego);

background = axes('unit', 'normalized', 'position', [0 0 1 1]);
imagen = backback;
imagesc(imagen);
set(background, 'handlevisibility', 'off', 'visible', 'off');
imagenTitle = django;
%imagenTitle = imresize(imagenTitle, [151 351]);
axes(handles.axes6);
imshow(imagenTitle);
uistack(handles.uipanel1, 'top')
uistack(handles.uipanel2, 'top')
uistack(handles.axes1, 'top')
uistack(handles.axes3, 'top')
uistack(handles.text16, 'top')

% Valores por defecto
handles.t = 2;
handles.n_muestras = 128;
handles.a = 0.95;
handles.despl = 64;
handles.cepstrum = 10;
handles.p = 4;
%Ventanas
handles.Hamming = 'hamming';
handles.Hanning = 'hanning';
handles.Rectwin = 'rectwin';
handles.Bartlett = 'bartlett';
handles.Blackman = 'blackman';
handles.Boxcar = 'boxcar';
handles.Triang = 'triang';
handles.Gausswin = 'gausswin';
handles.ventana = handles.Hamming;

% Fichero de patrones
if exist('patrones.mat')
    load('patrones.mat');
    handles.senal1 = senal1;
    handles.senal2 = senal2;
    handles.senal3 = senal3;
    handles.senal4 = senal4;
    handles.patron1 = patron1;
    handles.patron2 = patron2;
    handles.patron3 = patron3;
    handles.patron4 = patron4;
    handles.patron1Recortado = patron1Recortado;
    handles.patron2Recortado = patron2Recortado;
    handles.patron3Recortado = patron3Recortado;
    handles.patron4Recortado = patron4Recortado;
    handles.Fs = Fs;
else
    handles.senal1 = 0;
    handles.senal2 = 0;
    handles.senal3 = 0;
    handles.senal4 = 0;
    handles.patron1 = 0;
    handles.patron2 = 0;
    handles.patron3 = 0;
    handles.patron4 = 0;
    handles.patron1Recortado = 0;
    handles.patron2Recortado = 0;
    handles.patron3Recortado = 0;
    handles.patron4Recortado = 0;
    handles.Fs = 8000;
end

guidata(hObject, handles); % Update handles structure





% --- Outputs from this function are returned to the command line.
function varargout = ReconocedorGUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output; 



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double

NewStrVal = get(hObject, 'String'); %Almacenar valor ingresado
NewVal = str2double(NewStrVal); %Transformar a formato double
handles.t = NewVal; %Almacenar en puntero
guidata(hObject,handles); %Salvar datos de la aplicación


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.Fs = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function n_muestras_Callback(hObject, eventdata, handles)
% hObject    handle to n_muestras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_muestras as text
%        str2double(get(hObject,'String')) returns contents of n_muestras as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.n_muestras = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function n_muestras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_muestras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.a = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function despl_Callback(hObject, eventdata, handles)
% hObject    handle to despl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of despl as text
%        str2double(get(hObject,'String')) returns contents of despl as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.despl = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function despl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to despl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ventana.
function ventana_Callback(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ventana contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ventana

val=get(hObject,'Value');
str=get(hObject,'String');
switch str{val}
    case 'Hanning'
        handles.ventana = handles.Hanning;
    case 'Hamming'
        handles.ventana = handles.Hamming;
    case 'Rectwin'
        handles.ventana = handles.Rectwin;
    case 'Bartlett'
        handles.ventana = handles.Bartlett;
    case 'Blackman'
        handles.ventana = handles.Blackman;
    case 'Boxcar'
        handles.ventana = handles.Boxcar;
    case 'Triang'
        handles.ventana = handles.Triang;
    case 'Gausswin'
        handles.ventana = handles.Gausswin;
end


% --- Executes during object creation, after setting all properties.
function ventana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: ventana controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in botonGrabar.
function botonGrabar_Callback(hObject, eventdata, handles)
% hObject    handle to botonGrabar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

t = handles.t;
Fs = handles.Fs;
senal = grabacion(t * Fs, Fs, 1);
handles.senal = senal;
guidata(hObject, handles);
axes(handles.axes1);
plot(senal,'m')


% --- Executes on button press in botonReproducir.
function botonReproducir_Callback(hObject, eventdata, handles)
% hObject    handle to botonReproducir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

reproducir(handles.senal);


% --- Executes on button press in botonJuego.
function botonJuego_Callback(hObject, eventdata, handles)
% hObject    handle to botonJuego (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

t = handles.t;
n_muestras = handles.n_muestras;
a = handles.a;
despl = handles.despl;
ceps = handles.cepstrum;
p = handles.p;
ventana = handles.ventana;
Fs = handles.Fs;
save('parametrosJuego.mat', 't', 'n_muestras', 'a', 'despl', 'ceps', 'p', 'ventana', 'Fs');
close(handles.figure1);
ReconocedorGUI2
%uiwait % Espera
%close ReconocedorGUI1 %cierra




function cepstrum_Callback(hObject, eventdata, handles)
% hObject    handle to cepstrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cepstrum as text
%        str2double(get(hObject,'String')) returns contents of cepstrum as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.cepstrum = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function cepstrum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cepstrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_Callback(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p as text
%        str2double(get(hObject,'String')) returns contents of p as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.p = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BotonGrabarPatron1.
function BotonGrabarPatron1_Callback(hObject, eventdata, handles)
% hObject    handle to BotonGrabarPatron1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

senal1 = grabacion(handles.t * handles.Fs, handles.Fs, 1);
handles.senal1 = senal1;
axes(handles.axes1);
plot(senal1,'m')
ppatron1 = preenfasis(senal1, handles.a);
segmentos = segmentacion(ppatron1, handles.n_muestras, handles.despl);
segEnv = enventanado(segmentos, handles.ventana);
[lz, lo] = inicio_fin(segEnv);
inic = lz * handles.despl;
fin = lo * handles.despl;
patron1Recortado = senal1(inic : fin);
handles.patron1Recortado = patron1Recortado;
axes(handles.axes3);
plot(handles.patron1Recortado,'m')
coeficientes = delta(cepstrum(segEnv(:, lz : lo), handles.cepstrum + 1), handles.p);
patron1 = normaliza(coeficientes);
handles.patron1 = patron1;
persistenciaPatrones(handles);

guidata(hObject, handles);


% --- Executes on button press in BotonReproducirPatron2.
function BotonReproducirPatron1_Callback(hObject, eventdata, handles)
% hObject    handle to BotonReproducirPatron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
plot(handles.senal1,'m')
axes(handles.axes3);
plot(handles.patron1Recortado,'m')
reproducir(handles.patron1Recortado);

% --- Executes on button press in BotonGrabarPatron2.
function BotonGrabarPatron2_Callback(hObject, eventdata, handles)
% hObject    handle to BotonGrabarPatron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

senal2 = grabacion(handles.t * handles.Fs, handles.Fs, 1);
handles.senal2 = senal2;
axes(handles.axes1);
plot(senal2,'m')
ppatron2 = preenfasis(senal2, handles.a);
segmentos = segmentacion(ppatron2, handles.n_muestras, handles.despl);
segEnv = enventanado(segmentos, handles.ventana);
[lz, lo] = inicio_fin(segEnv);
inic = lz * handles.despl;
fin = lo * handles.despl;
patron2Recortado = senal2(inic : fin);
handles.patron2Recortado = patron2Recortado;
axes(handles.axes3);
plot(handles.patron2Recortado,'m')
coeficientes = delta(cepstrum(segEnv(:, lz : lo), handles.cepstrum + 1), handles.p);
patron2 = normaliza(coeficientes);
handles.patron2 = patron2;
persistenciaPatrones(handles);

guidata(hObject, handles);


% --- Executes on button press in botonreproducirpatron2.
function BotonReproducirPatron2_Callback(hObject, eventdata, handles)
% hObject    handle to botonreproducirpatron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
plot(handles.senal2,'m')
axes(handles.axes3);
plot(handles.patron2Recortado,'m')
reproducir(handles.patron2Recortado);


% --- Executes on button press in BotonGrabarPatron3.
function BotonGrabarPatron3_Callback(hObject, eventdata, handles)
% hObject    handle to BotonGrabarPatron3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

senal3 = grabacion(handles.t * handles.Fs, handles.Fs, 1);
handles.senal3 = senal3;
axes(handles.axes1);
plot(senal3,'m')
ppatron3 = preenfasis(senal3, handles.a);
segmentos = segmentacion(ppatron3, handles.n_muestras, handles.despl);
segEnv = enventanado(segmentos, handles.ventana);
[lz, lo] = inicio_fin(segEnv);
inic = lz * handles.despl;
fin = lo * handles.despl;
patron3Recortado = senal3(inic : fin);
handles.patron3Recortado = patron3Recortado;
axes(handles.axes3);
plot(handles.patron3Recortado,'m')
coeficientes = delta(cepstrum(segEnv(:, lz : lo), handles.cepstrum + 1), handles.p);
patron3 = normaliza(coeficientes);
handles.patron3 = patron3;
persistenciaPatrones(handles);

guidata(hObject, handles);


% --- Executes on button press in BotonReproducirPatron3.
function BotonReproducirPatron3_Callback(hObject, eventdata, handles)
% hObject    handle to BotonReproducirPatron3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
plot(handles.senal3,'m')
axes(handles.axes3);
plot(handles.patron3Recortado,'m')
reproducir(handles.patron3Recortado);


% --- Executes on button press in BotonGrabarPatron4.
function BotonGrabarPatron4_Callback(hObject, eventdata, handles)
% hObject    handle to BotonGrabarPatron4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

senal4 = grabacion(handles.t * handles.Fs, handles.Fs, 1);
handles.senal4 = senal4;
axes(handles.axes1);
plot(senal4,'m')
ppatron4 = preenfasis(senal4, handles.a);
segmentos = segmentacion(ppatron4, handles.n_muestras, handles.despl);
segEnv = enventanado(segmentos, handles.ventana);
[lz, lo] = inicio_fin(segEnv);
inic = lz * handles.despl;
fin = lo * handles.despl;
patron4Recortado = senal4(inic : fin);
handles.patron4Recortado = patron4Recortado;
axes(handles.axes3);
plot(handles.patron4Recortado,'m')
coeficientes = delta(cepstrum(segEnv(:, lz : lo), handles.cepstrum + 1), handles.p);
patron4 = normaliza(coeficientes);
handles.patron4 = patron4;
persistenciaPatrones(handles);

guidata(hObject, handles);


% --- Executes on button press in BotonReproducirPatron4.
function BotonReproducirPatron4_Callback(hObject, eventdata, handles)
% hObject    handle to BotonReproducirPatron4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
plot(handles.senal4,'m')
axes(handles.axes3);
plot(handles.patron4Recortado,'m')
reproducir(handles.patron4Recortado);

function persistenciaPatrones(handles)
    senal1 = handles.senal1;
    senal2 = handles.senal2;
    senal3 = handles.senal3;
    senal4 = handles.senal4;
    patron1 = handles.patron1;
    patron2 = handles.patron2;
    patron3 = handles.patron3;
    patron4 = handles.patron4;
    patron1Recortado = handles.patron1Recortado;
    patron2Recortado = handles.patron2Recortado;
    patron3Recortado = handles.patron3Recortado;
    patron4Recortado = handles.patron4Recortado;
    Fs = handles.Fs;
    save('patrones.mat', 'senal1', 'senal2', 'senal3', 'senal4', 'patron1', 'patron2', 'patron3', 'patron4', 'patron1Recortado', 'patron2Recortado', 'patron3Recortado', 'patron4Recortado', 'Fs');


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)

% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
