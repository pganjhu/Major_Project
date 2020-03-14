function varargout = Main_Segmentation_Recognition(varargin)
% MAIN_SEGMENTATION_RECOGNITION MATLAB code for Main_Segmentation_Recognition.fig
%      MAIN_SEGMENTATION_RECOGNITION, by itself, creates a new MAIN_SEGMENTATION_RECOGNITION or raises the existing
%      singleton*.
%
%      H = MAIN_SEGMENTATION_RECOGNITION returns the handle to a new MAIN_SEGMENTATION_RECOGNITION or the handle to
%      the existing singleton*.
%
%      MAIN_SEGMENTATION_RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_SEGMENTATION_RECOGNITION.M with the given input arguments.
%
%      MAIN_SEGMENTATION_RECOGNITION('Property','Value',...) creates a new MAIN_SEGMENTATION_RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_Segmentation_Recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_Segmentation_Recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_Segmentation_Recognition

% Last Modified by GUIDE v2.5 11-Apr-2018 12:56:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_Segmentation_Recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_Segmentation_Recognition_OutputFcn, ...
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


% --- Executes just before Main_Segmentation_Recognition is made visible.
function Main_Segmentation_Recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_Segmentation_Recognition (see VARARGIN)

% Choose default command line output for Main_Segmentation_Recognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_Segmentation_Recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_Segmentation_Recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Segmentation.
function Segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to Segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Apply_Segmentation

% --- Executes on button press in Training.
function Training_Callback(hObject, eventdata, handles)
% hObject    handle to Training (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Convert to binary image
clc
trainDetector;

% --- Executes on button press in Testing.
function Testing_Callback(hObject, eventdata, handles)
% hObject    handle to Testing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
[fin1 path] = uigetfile('*.png','pick a Scene Text Image');
imageFile=strcat(path,fin1);
imagen=imread(imageFile);
%imagen=imread('Kannada_Text_4.png');
img=imagen;
img1=img;
Validate;
imagen=imagen(:,:,1);
figure
subplot(211)
imshow(imresize(imagen,[256 256])),title('INPUT IMAGE');

threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);


%% Label connected components
% Remove all object containing fewer than 30 pixels

imagen = bwareaopen(imagen,30);
[fl re]=lines(imagen);
for i = 1: 10

    if ~isempty(re)
        figure
        subplot(5,1,1)
        imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
        subplot(5,1,2)
        imshow(fl,[]); title('Segmented Characters Detected')
        plotting;
       [fl re]=lines(re);
    else
        figure
        subplot(5,1,1)
        imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
        subplot(5,1,2)
        imshow(fl,[]); title('Segmented Characters Detected')
        plotting;        
        break;
    end
end
imagen =~im2bw(img1,threshold);
imagen = bwareaopen(imagen,30);
[fl re]=lines(imagen);
    figure(11)
for i = 1: 10

    if ~isempty(re)
        if i==1
            %subplot(5,5,1)
            %imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
            subplot(5,1,1)
            imshow(fl,[]); title('Segmented Characters Detected')
            
            plotting;
        end
        hold on
        if i==2
            %subplot(5,5,3)
            %imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
            subplot(5,1,2)
            imshow(fl,[]); title('Segmented Characters Detected')
            
            plotting;
        end        
    hold on
        if i==3
            %subplot(5,5,5)
            %imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
            subplot(5,1,3)
            imshow(fl,[]); title('Segmented Characters Detected')
            
            plotting;
        end     
    hold on
        if i==4
            %subplot(5,5,7)
            %imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
            subplot(5,1,4)
            imshow(fl,[]); title('Segmented Characters Detected')
            
            plotting;
        end     
   hold on
        if i==5
           % subplot(5,5,1)
           % imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
            subplot(5,1,5)
            imshow(fl,[]); title('Segmented Characters Detected')
            
            plotting;
        end            
       [fl re]=lines(re);
    else
        figure
        %subplot(1,5,1)
        %imshow(fl,[]); title(['Segmented Output of Line = ',num2str(i)])
        subplot(5,1,5)
        imshow(fl,[]); title('Segmented Characters Detected')
        plotting;        
        break;
    end
end


% --- Executes on button press in myocr.
function myocr_Callback(hObject, eventdata, handles)
% hObject    handle to myocr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cd OCR

OCR

cd ..