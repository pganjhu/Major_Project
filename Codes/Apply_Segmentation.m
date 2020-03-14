function varargout = Apply_Segmentation(varargin)
% APPLY_SEGMENTATION MATLAB code for Apply_Segmentation.fig
%      APPLY_SEGMENTATION, by itself, creates a new APPLY_SEGMENTATION or raises the existing
%      singleton*.
%
%      H = APPLY_SEGMENTATION returns the handle to a new APPLY_SEGMENTATION or the handle to
%      the existing singleton*.
%
%      APPLY_SEGMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLY_SEGMENTATION.M with the given input arguments.
%
%      APPLY_SEGMENTATION('Property','Value',...) creates a new APPLY_SEGMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Apply_Segmentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Apply_Segmentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Apply_Segmentation

% Last Modified by GUIDE v2.5 10-Mar-2018 15:58:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Apply_Segmentation_OpeningFcn, ...
                   'gui_OutputFcn',  @Apply_Segmentation_OutputFcn, ...
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


% --- Executes just before Apply_Segmentation is made visible.
function Apply_Segmentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Apply_Segmentation (see VARARGIN)

% Choose default command line output for Apply_Segmentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Apply_Segmentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Apply_Segmentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen Colourimagen
clc;
[fin1 path] = uigetfile('*.jpg','*.png','pick a Scene Text Image');
imageFile=strcat(path,fin1);
imagen=imread(imageFile);
Colourimagen=imagen;
figure(1),
imshow(uint8(imagen)), title('Original Input Scene with Text');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Convert to gray scale
global imagen
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
figure(2),
imshow(uint8(imagen)), title('RGB to Gray Scale Converted Image');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)%% Convert to binary image
global imagen
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
figure(3),
imshow(uint8(imagen),[]), title('Threshold Computed for Gray Scale');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen
 BW2 = edge(imagen,'canny');

figure(4),
imshow(uint8(BW2),[]), title('Canny Edge Output');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen
%% Remove all object containing fewer than 10 pixels
imagen = bwareaopen(imagen,10);
figure(5),
imshow(uint8(imagen),[]), title('Remove all object containing fewer than 10 pixels');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Features Extraction
global Colourimagen
figure(6),
[hog1, visualization] = extractHOGFeatures(Colourimagen,'CellSize',[32 32]);
    subplot(1,2,1);
    imshow(Colourimagen);title('Input Image')
    subplot(1,2,2);
    plot(visualization);title('Histogram Orienated Gradient Out')
% --- Executes on button press in pushbutton7.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagen=imread('./train/kannada_letters11.jpg');

%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,5);
figure(9),imshow(~imagen),title('INPUT IMAGE WITHOUT NOISE');
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
%pause (0.5)
j=1;
FEtrain=[];
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    [m2 n2 ch]=size(n1);
    %if ((m2 < 15) && (n2 <15))
        n1=imresize(n1,[75 75]);
        out1{j}=~n1;
        figure(9),imshow(~n1), title('Detected Characters')
        hold on;
        pause(0.5)
        temp =~n1;
        FEtrain=[FEtrain temp];
    %end
end
n1=j;

[net] = MLKernel_Training(FEtrain');

save('dbNet.mat','net','FEtrain');
disp('Training completed')


% --- Executes on button press in pushbutton8.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global imagen
[fin1 path] = uigetfile('*.jpg','*.png','pick a Scene Text Image');
imageFile=strcat(path,fin1);
imagen=imread(imageFile);
%Colourimagen=imagen;
figure(10),
imshow(uint8(imagen)), title('Test Input Scene Text Image');
load dbNet.mat
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,30);
figure(11),imshow(~imagen),title('INPUT IMAGE WITHOUT NOISE');
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (0.5)
j=1;
a=1;
b=1;
image=imagen;
figure(12),
imagen = bwNoiseReduction(imagen,8);
FEtest=[];
for n=1:Ne
    [r,c] = find(L==n);
     n1=imagen(min(r):max(r),min(c):max(c));
    [m2,n2,ch]=size(n1);
    %if ((m2 >= 150 && m2 < 150) || (n2 >= 50 && n2 < 150))
        n1=imresize(n1,[75 75]);
        out1{j}=~n1;
        subplot(211),imshow(~n1), title('Found')
        hold on;
        im1=~n1;
        im1= im1';
        im1=imresize(im1,[5 7]);
        im=im2col(im1,[1 1]);
        subplot(212),tree_Structure_model(~im), title('Sturture Output');
        j=j+1;
        temp=~n1;
        FEtest=[FEtest temp];
        pause(0.5)
    %end
end
No_of_Characters_Found= j
load dbNet.mat;
[m,n,ch]=size(FEtrain);
[Confusionmatrix,  residuals] = MLKernel_Testing (FEtest', net,FEtrain, FEtest');
Confusionmatrix
msgbox('Recognized Characters Finished')

% for n = 1: 5 %length(out1)
%     V{n}=out1{n};
%     V1=imresize(V{n},[25 25]);
%     x=Bayes(1/100,n/100,9.6/100,1)
%     pred = x;
% end
