function varargout = modul2(varargin)
% MODUL2 MATLAB code for modul2.fig
%      MODUL2, by itself, creates a new MODUL2 or raises the existing
%      singleton*.
%
%      H = MODUL2 returns the handle to a new MODUL2 or the handle to
%      the existing singleton*.
%
%      MODUL2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODUL2.M with the given input arguments.
%
%      MODUL2('Property','Value',...) creates a new MODUL2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modul2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modul2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modul2

% Last Modified by GUIDE v2.5 29-May-2022 03:41:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modul2_OpeningFcn, ...
                   'gui_OutputFcn',  @modul2_OutputFcn, ...
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


% --- Executes just before modul2 is made visible.
function modul2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to modul2 (see VARARGIN)

% Choose default command line output for modul2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes modul2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = modul2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnOpen.
function btnOpen_Callback(hObject, eventdata, handles)
global img;
global file;
global path;
[file, path] = uigetfile({'*.jpg';'*.png';'*.bmp'},...
    'Select an icon file','icon.png');

fullname = strcat(path, file);
img = imread(fullname);
axes(handles.axes1);
imshow(img);
% hObject    handle to btnOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in btnGrayscale.
function btnGrayscale_Callback(hObject, eventdata, handles)
global img;
global imageGscale;

imageGscale = rgb2gray(img);
axes(handles.axes2)
imshow(imageGscale)
% hObject    handle to btnGrayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnBiner.
function btnBiner_Callback(hObject, eventdata, handles)
global imageGscale;
global imageBiner;
level = 0.5;
imageBiner = im2bw(imageGscale, level);
axes(handles.axes3);
imshow(imageBiner);
% hObject    handle to btnBiner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnNoise.
function btnNoise_Callback(hObject, eventdata, handles)
global imageGscale;
global noise;

noise = imnoise(imageGscale);
axes(handles.axes4);
imshow(noise);
% hObject    handle to btnNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnExit.
function btnExit_Callback(hObject, eventdata, handles)
pilihan = questdlg('Yakin untuk keluar aplikasi? '), ...
                    'Keluar Aplikasi',...
                    'Yes', 'Cancel', 'Cancel';
switch pilihan
    case 'Yes'
        closereq();
    case 'Cancel'
        return;
end
% hObject    handle to btnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lp3.
function lp3_Callback(hObject, eventdata, handles)
global noise;
global kernel;
global lp3;

%kernel = ones(3,3)/9;
kernel = [1 1 1;
          1 1 1;
          1 1 1];
lp3 = imfilter(noise, kernel/9);
axes(handles.axes6);
imshow(lp3);
% hObject    handle to lp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lp5.
function lp5_Callback(hObject, eventdata, handles)
global noise;
global kernel;
global lp5;

kernel = ones(5,5)/25;
lp5 = imfilter(noise, kernel);
axes(handles.axes6);
imshow(lp5);
% hObject    handle to lp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lp7.
function lp7_Callback(hObject, eventdata, handles)
global noise;
global kernel;
global lp7;

kernel = ones(7,7)/49;
lp7 = imfilter(noise, kernel);
axes(handles.axes6);
imshow(lp7);
% hObject    handle to lp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lp9.
function lp9_Callback(hObject, eventdata, handles)
global noise;
global kernel;
global lp9;

kernel = ones(9,9)/81;
lp9 = imfilter(noise, kernel);
axes(handles.axes6);
imshow(lp9);
% hObject    handle to lp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in md3.
function md3_Callback(hObject, eventdata, handles)
global noise;
global md3;
global smooth2;
md3 = [3 3];
smooth2 = medfilt2(noise, md3);
axes(handles.axes6);
imshow(smooth2)
% hObject    handle to md3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in md5.
function md5_Callback(hObject, eventdata, handles)
global noise;
global md5;
global smooth2;
md5 = [5 5];
smooth2 = medfilt2(noise, md5);
axes(handles.axes6);
imshow(smooth2)
% hObject    handle to md5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in md7.
function md7_Callback(hObject, eventdata, handles)
global noise;
global md7;
global smooth2;
md7 = [7 7];
smooth2 = medfilt2(noise, md7);
axes(handles.axes6);
imshow(smooth2)
% hObject    handle to md7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in md9.
function md9_Callback(hObject, eventdata, handles)
global noise;
global md9;
global smooth2;
md9 = [9 9];
smooth2 = medfilt2(noise, md9);
axes(handles.axes6);
imshow(smooth2)
% hObject    handle to md9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hp3.
function hp3_Callback(hObject, eventdata, handles)
global img;
global kernel;
global hp3;
kernel = [-1 -1 -1;
          -1 8 -1;
          -1 -1 -1];
hp3 = imfilter(img, kernel, 'same');
axes(handles.axes6);
imshow(hp3);
% hObject    handle to hp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hp5.
function hp5_Callback(hObject, eventdata, handles)
global img;
global kernel;
global hp5;
kernel = [0 -1 -1 -1 0;
          -1 2 -4 2 -1;
          -1 -4 13 -4 -1;
          -1 2 -4 2 -1;
          0 -1 -1 -1 0];
hp5 = imfilter(img, kernel, 'same');
axes(handles.axes6);
imshow(hp5);
% hObject    handle to hp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hp7.
function hp7_Callback(hObject, eventdata, handles)
global img;
global kernel;
global hp7;
kernel = [0 -1 -1 -1 -1 -1 0;
          -1 2 -4 6 -4 2 -1;
          -1 -4 6 -13 6 -4 -1;
          -1 6 -8 15 -8 6 -1;
          -1 -4 6 -13 6 -4 -1;
          -1 2 -4 6 -4 2 -1;
          0 -1 -1 -1 -1 -1 0];
hp7 = imfilter(img, kernel, 'same');
axes(handles.axes6);
imshow(hp7);
% hObject    handle to hp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hp9.
function hp9_Callback(hObject, eventdata, handles)
global img;
global kernel;
global hp9;
kernel = [0 -1 -1 -1 -1 -1 -1 -1 0;
          -1 2 -4 6 -13 6 -4 2 -1;
          -1 -4 6 -13 17 -13 6 -4 -1;
          -1 6 -13 17 -21 17 -13 6 -1;
          -1 -13 17 -21 29 -21 17 -13 -1;
          -1 6 -13 17 -21 17 -13 6 -1;
          -1 -4 6 -13 17 -13 6 -4 -1;
          -1 2 -4 6 -13 6 -4 2 -1;
          0 -1 -1 -1 -1 -1 -1 -1 0;];
hp9 = imfilter(img, kernel, 'same');
axes(handles.axes6);
imshow(hp9);
% hObject    handle to hp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBr_Callback(hObject, eventdata, handles)
global imageGscale;
global brightness;
global sldvar;

sliderVal = get(hObject, 'value');
sldvar = sliderVal;
brightness = imageGscale + sldvar;
axes(handles.axes5);
assignin('base', 'sliderVal', sliderVal);
set(handles.nomorBr, 'string', num2str(sliderVal));
imshow(brightness);
% hObject    handle to sliderBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderBr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function nomorBr_Callback(hObject, eventdata, handles)
edit = get(hObject, 'string');
set(handles.slider, 'value', str2num(edit));
guidata(hObject, handles);
% hObject    handle to nomorBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nomorBr as text
%        str2double(get(hObject,'String')) returns contents of nomorBr as a double


% --- Executes during object creation, after setting all properties.
function nomorBr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nomorBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
