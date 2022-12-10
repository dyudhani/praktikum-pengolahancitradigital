function varargout = modul4(varargin)
% MODUL4 MATLAB code for modul4.fig
%      MODUL4, by itself, creates a new MODUL4 or raises the existing
%      singleton*.
%
%      H = MODUL4 returns the handle to a new MODUL4 or the handle to
%      the existing singleton*.
%
%      MODUL4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODUL4.M with the given input arguments.
%
%      MODUL4('Property','Value',...) creates a new MODUL4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modul4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modul4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modul4

% Last Modified by GUIDE v2.5 05-Jun-2022 03:48:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modul4_OpeningFcn, ...
                   'gui_OutputFcn',  @modul4_OutputFcn, ...
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


% --- Executes just before modul4 is made visible.
function modul4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to modul4 (see VARARGIN)

% Choose default command line output for modul4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes modul4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = modul4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
global file;
global path;
global filename;
global img;

[file, path] = uigetfile({'*.jpg';'*.png';'*.bmp'},...
    'Select an icon file','icon.png');
filename = strcat(path, file);
img = imread(filename);
axes(handles.axes1);
setappdata(0, 'img', img);
imshow(img);

%setappdata(0, 'img', img_gs);
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_biner.
function btn_biner_Callback(hObject, eventdata, handles)
img_bnr = getappdata(0, 'img');
gray = rgb2gray(img_bnr);
bw = imbinarize(gray);
setappdata(0, 'bw', bw);

axes(handles.axes2);
imshow(bw);
title('Citra Biner');
% hObject    handle to btn_biner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in keluarProgram.
function keluarProgram_Callback(hObject, eventdata, handles)
pilihan = questdlg('Yakin untuk keluar aplikasi? ');
switch pilihan
    case 'Yes'
        closereq();
    case 'Cancel'
        return;
end
% hObject    handle to keluarProgram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_dilasi.
function btn_dilasi_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
dilasi = imdilate(img, ones(9,9));

axes(handles.axes2);
imshow(dilasi);
title('Morfologi Dilasi');
% hObject    handle to btn_dilasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_erosi.
function btn_erosi_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
img_1 = 1-img;
erosi = imerode(img_1, ones(9,9));

axes(handles.axes3);
imshow(erosi);
title('Morfologi Erosi');
% hObject    handle to btn_erosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_opening.
function btn_opening_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
opening = imopen(img, ones(9,9));

axes(handles.axes2);
imshow(opening);
title('Morfologi Opening');
% hObject    handle to btn_opening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_closing.
function btn_closing_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
closing = imclose(img, ones(9,9));

axes(handles.axes3);
imshow(closing);
title('Morfologi Closing');
% hObject    handle to btn_closing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_thinning.
function btn_thinning_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
thinning = bwskel(img);

axes(handles.axes2);
imshow(thinning);
title('Morfologi Thinning');
% hObject    handle to btn_thinning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_sobel.
function btn_sobel_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
hz = (conv2(img, [-1 0 1; -2 0 2; -1 0 1], 'same'));
vr = (conv2(img, [-1 -2 -1; 0 0 0; 1 2 2], 'same'));
mg = sqrt((hz.^2) + (vr.^2));

axes(handles.axes2);
imshow(hz);
title('Segmentasi Sobel Horizontal');

axes(handles.axes3);
imshow(vr);
title('Segmentasi Sobel Vertical');

axes(handles.axes4);
imshow(mg);
title('Segmentasi Sobel Magnitudo');
% hObject    handle to btn_sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_robert.
function btn_robert_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
hz = (conv2(img, [0 1; -1 0], 'same'));
vr = (conv2(img, [1 0; 0 -1], 'same'));
mg = sqrt((hz.^2) + (vr.^2));

axes(handles.axes2);
imshow(hz);
title('Segmentasi Robert Horizontal');

axes(handles.axes3);
imshow(vr);
title('Segmentasi Robert Vertical');

axes(handles.axes4);
imshow(mg);
title('Segmentasi Robert Magnitudo');
% hObject    handle to btn_robert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_prewitt.
function btn_prewitt_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
hz = (conv2(img, [-1 0 1; -1 0 1; -1 0 1], 'same'));
vr = (conv2(img, [-1 -1 -1; 0 0 0; 1 1 1], 'same'));
mg = sqrt((hz.^2) + (vr.^2));

axes(handles.axes2);
imshow(hz);
title('Segmentasi Prewitt Horizontal');

axes(handles.axes3);
imshow(vr);
title('Segmentasi Prewitt Vertical');

axes(handles.axes4);
imshow(mg);
title('Segmentasi Prewitt Magnitudo');
% hObject    handle to btn_prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_canny.
function btn_canny_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
canny = edge(img, 'canny');

axes(handles.axes2);
imshow(canny);
title('Segmentasi Canny');
% hObject    handle to btn_canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_log.
function btn_log_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
log = edge(img, 'log');

axes(handles.axes3);
imshow(log);
title('Segmentasi LOG');
% hObject    handle to btn_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_region.
function btn_region_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
rgngrowing = regiongrowing(im2double(img), 50, 50,0.2);

axes(handles.axes2);
imshow(rgngrowing);
title('Segmentasi Region Growing');
% hObject    handle to btn_region (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_watershed.
function btn_watershed_Callback(hObject, eventdata, handles)
img = getappdata(0, 'bw');
ws = watershed(img);
rgb = label2rgb(ws, 'spring', 'c', 'shuffle');

axes(handles.axes3);
imshow(rgb);
title('Segmentasi Watershed');
% hObject    handle to btn_watershed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
