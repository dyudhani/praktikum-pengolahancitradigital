function varargout = modul3(varargin)
% MODUL3 MATLAB code for modul3.fig
%      MODUL3, by itself, creates a new MODUL3 or raises the existing
%      singleton*.
%
%      H = MODUL3 returns the handle to a new MODUL3 or the handle to
%      the existing singleton*.
%
%      MODUL3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODUL3.M with the given input arguments.
%
%      MODUL3('Property','Value',...) creates a new MODUL3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modul3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modul3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modul3

% Last Modified by GUIDE v2.5 29-May-2022 07:29:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modul3_OpeningFcn, ...
                   'gui_OutputFcn',  @modul3_OutputFcn, ...
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


% --- Executes just before modul3 is made visible.
function modul3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to modul3 (see VARARGIN)

% Choose default command line output for modul3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes modul3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = modul3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
global img;
global img_gs;
global file;
global path;

[file, path] = uigetfile({'*.jpg';'*.png';'*.bmp'},...
    'Select an icon file','icon.png');
filename = strcat(path, file);
setappdata(0, 'filename', filename);
img = imread(filename);
img_gs =rgb2gray(img);
axes(handles.axes1);
imshow(img_gs);
setappdata(0, 'img', img_gs);
title('Citra Asli');
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
pilihan = questdlg('Yakin untuk keluar aplikasi? '), ...
                    'Keluar Aplikasi',...
                    'Yes', 'Cancel';
switch pilihan
    case 'Yes'
        closereq();
    case 'Cancel'
        return;
end
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnDft.
function btnDft_Callback(hObject, eventdata, handles)
global img;
global dft;
global dftlog;

img = getappdata(0, 'img');
dft = fft2(img);
setappdata(0, 'imgdft', dft);
dftlog = log(abs(dft));
axes(handles.axes2);
imshow(mat2gray(log(1+abs(dftlog))));
title('DFT');
% hObject    handle to btnDft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in iDft.
function iDft_Callback(hObject, eventdata, handles)
global img;
global idft;

img = getappdata(0, 'imgdft');
idft = ifft2(img);
axes(handles.axes3);
imshow(uint8(real(idft)));
title('INVERSE DFT');
% hObject    handle to iDft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnDct.
function btnDct_Callback(hObject, eventdata, handles)
global img;
global dct;

img = getappdata(0, 'img');
dct = dct2(img);
setappdata(0, 'imgdct', dct);
axes(handles.axes2);
imshow(mat2gray(log(1+abs(dct))));
title('DCT');
% hObject    handle to btnDct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in iDct.
function iDct_Callback(hObject, eventdata, handles)
global img;
global idct;

img = getappdata(0, 'imgdct');
idct = idct2(img);
axes(handles.axes3);
imshow(uint8(real(idct)));
title('Inverse DCT');
% hObject    handle to iDct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnFft.
function btnFft_Callback(hObject, eventdata, handles)
global img;
global fft;
global fftlog;

img = getappdata(0, 'img');
fft = fft2(img);
setappdata(0, 'imgfft', fft);
fftlog = log(1+abs(fftshift(fft)));
axes(handles.axes2);
imshow(mat2gray(log(1+abs(fftlog))));
title('FFT');
% hObject    handle to btnFft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in iFft.
function iFft_Callback(hObject, eventdata, handles)
global img;
global ifft;

img = getappdata(0, 'imgfft');
ifft = ifft2(img);
axes(handles.axes3);
imshow(uint8(real(ifft)));
title('Inverse FFT');
% hObject    handle to iFft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnWavelet.
function btnWavelet_Callback(hObject, eventdata, handles)
global img_gs;

img_gs = getappdata(0, 'img');
[LoD, HiD] = wfilters('haar', 'd');
[cA, cH, cV, cD] = dwt2(img_gs, LoD, HiD, 'sym4', 'mode', 'per');
setappdata(0, 'cA', cA);
setappdata(0, 'cH', cH);
setappdata(0, 'cV', cV);
setappdata(0, 'cD', cD);
axes(handles.axes2);
montage({img_gs,cH,cV,cD},'Size', [2,2]);
title('Wavelet');
% hObject    handle to btnWavelet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in iWavelet.
function iWavelet_Callback(hObject, eventdata, handles)
global iWavelet;

[LoD, HiD] = wfilters('haar', 'd');
cA = getappdata(0, 'cA');
cH = getappdata(0, 'cH');
cV = getappdata(0, 'cV');
cD = getappdata(0, 'cD');
iWavelet = idwt2(cA, cH, cV, cD, LoD, HiD, 'sym4', 'mode', 'per');
axes(handles.axes3);
imshow(uint8(iWavelet));
title('Inverse Wavelet');
% hObject    handle to iWavelet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
