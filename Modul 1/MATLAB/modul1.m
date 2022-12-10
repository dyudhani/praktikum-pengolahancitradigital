function varargout = modul1(varargin)
% MODUL1 MATLAB code for modul1.fig
%      MODUL1, by itself, creates a new MODUL1 or raises the existing
%      singleton*.
%
%      H = MODUL1 returns the handle to a new MODUL1 or the handle to
%      the existing singleton*.
%
%      MODUL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODUL1.M with the given input arguments.
%
%      MODUL1('Property','Value',...) creates a new MODUL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before modul1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to modul1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help modul1

% Last Modified by GUIDE v2.5 06-Jun-2022 14:37:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @modul1_OpeningFcn, ...
                   'gui_OutputFcn',  @modul1_OutputFcn, ...
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


% --- Executes just before modul1 is made visible.
function modul1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to modul1 (see VARARGIN)

% Choose default command line output for modul1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes modul1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = modul1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
global file;
global path;
global filename;
global img;

[file, path] = uigetfile({'*.jpg';'*.png';'*.bmp'},...
    'Select an icon file','icon.png');
filename = strcat(path, file);
img = imread(filename);
axes(handles.CitraAsli);
setappdata(0, 'citra', img);
imshow(img);
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in copy.
function copy_Callback(hObject, eventdata, handles)
Xc = getappdata(0, 'citra');
[sizex, sizey, sizez]= size(Xc);
blank = zeros(sizex,sizey,sizez);
for i=1:sizex
    for j=1:sizey
        for d=1:3
            blank(i,j,d)=Xc(i,j,d);
        end
    end
end
axes(handles.CitraCopy);
imshow(uint8(blank));
title('Image Copy');
% hObject    handle to copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
pilihan = questdlg('Are you sure want to close this app?', ...
    'Closing App', ...
    'Yes', 'No', 'No');
switch pilihan
    case 'Yes'
        closereq();
    case 'No'
        return;
end
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in red.
function red_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
red = citra;
red(:,:,2:3) = 0;
setappdata(0, 'filename', red);
axes(handles.CitraHasil);
imshow(red)
title('Red Channel');
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in green.
function green_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
green = citra;
green(:,:,1) = 0;
green(:,:,3) = 0;
setappdata(0, 'filename', green);
axes(handles.CitraHasil);
imshow(green)
title('Green Channel');
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in blue.
function blue_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
blue = citra;
blue(:,:,1:2) = 0;
setappdata(0, 'filename', blue);
axes(handles.CitraHasil);
imshow(blue)
title('Blue Channel');
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cyan.
function cyan_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
cyan = citra;
cyan(:,:,1) = 0;
setappdata(0, 'filename', cyan);
axes(handles.CitraHasil);
imshow(cyan)
title('Cyan Channel');
% hObject    handle to cyan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in magenta.
function magenta_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
magenta = citra;
magenta(:,:,2) = 0;
setappdata(0, 'filename', magenta);
axes(handles.CitraHasil);
imshow(magenta)
title('Magenta Channel');
% hObject    handle to magenta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in yellow.
function yellow_Callback(hObject, eventdata, handles)
citra = getappdata(0, 'citra');
yellow = citra;
yellow(:,:,3) = 0;
setappdata(0, 'filename', yellow);
axes(handles.CitraHasil);
imshow(yellow)
title('Yellow Channel');
% hObject    handle to yellow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
