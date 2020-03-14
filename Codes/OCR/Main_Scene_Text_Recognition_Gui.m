function varargout = Main_Scene_Text_Recognition_Gui(varargin)
% MAIN_SCENE_TEXT_RECOGNITION_GUI MATLAB code for Main_Scene_Text_Recognition_Gui.fig
%      MAIN_SCENE_TEXT_RECOGNITION_GUI, by itself, creates a new MAIN_SCENE_TEXT_RECOGNITION_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_SCENE_TEXT_RECOGNITION_GUI returns the handle to a new MAIN_SCENE_TEXT_RECOGNITION_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_SCENE_TEXT_RECOGNITION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_SCENE_TEXT_RECOGNITION_GUI.M with the given input arguments.
%
%      MAIN_SCENE_TEXT_RECOGNITION_GUI('Property','Value',...) creates a new MAIN_SCENE_TEXT_RECOGNITION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_Scene_Text_Recognition_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_Scene_Text_Recognition_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_Scene_Text_Recognition_Gui

% Last Modified by GUIDE v2.5 08-Apr-2018 23:43:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Main_Scene_Text_Recognition_Gui_OpeningFcn, ...
    'gui_OutputFcn',  @Main_Scene_Text_Recognition_Gui_OutputFcn, ...
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


% --- Executes just before Main_Scene_Text_Recognition_Gui is made visible.
function Main_Scene_Text_Recognition_Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_Scene_Text_Recognition_Gui (see VARARGIN)

% Choose default command line output for Main_Scene_Text_Recognition_Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_Scene_Text_Recognition_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_Scene_Text_Recognition_Gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in BrowseInput.
function BrowseInput_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Step 1: Browse a Image File
global imagen

[fin1 path] = uigetfile('*.jpg','*.png','pick a image file');
imageFile=strcat(path,fin1);
imagen=imread(imageFile);
[m n ch] =size(imagen);
% if m > 300 
 %   imagen=imresize(imagen,[256 256]);
% end
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
axes(handles.axes13),imshow(uint8(imagen)), %title('Original Input Scene with Text');

% --- Executes on button press in TrainingModel.
function TrainingModel_Callback(hObject, eventdata, handles)
% hObject    handle to TrainingModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%imagen=imread('./train/sample1.jpg');
imagen=imresize(imread('k2.jpg'),[512 512]);
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
imagen = imadjust(imagen);

%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,10);
axes(handles.axes13),imshow(~imagen),%title('INPUT IMAGE WITHOUT NOISE');
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
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    [m2 n2 ch]=size(n1);
    if ((m2 < 150) && (n2 <150))
        n1=imresize(n1,[125 125]);
        out1{j}=~n1;
        axes(handles.axes14),imshow(~n1), %title('Detected Characters')
        hold on;
        imgname=strcat(num2str(j),'.jpg');
        imwrite(out1{j},imgname);
%         im1=~n1;
%         im1= im1';
%         im1=imresize(im1,[5 7]);
%         im=im2col(im1,[1 1]);
%       %  axes(handles.axes14),(tree_Structure_model(~im)), %title('Sturture Output');
        j=j+1;
        pause(0.5)
    end
end
n1=out1{1};

meanUpperCase = ceil(1e6*mean(mean(n1(:,:,1)./255)));
avegAlphabets = meanUpperCase;
save('meanalphabets.mat','avegAlphabets');
% --- Executes on button press in EnhancedAlgo.
function EnhancedAlgo_Callback(hObject, eventdata, handles)
% hObject    handle to EnhancedAlgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Convert to binary image
global imagen
load meanalphabets.mat
imagen=imresize(imagen,[512 512]);
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
axes(handles.axes13), imshow(imagen)
imagen = imadjust(imagen);
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,5);
axes(handles.axes14),imshow(~imagen),%title('INPUT IMAGE WITHOUT NOISE');
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
image=imagen;
imagen = bwNoiseReduction(imagen,4);
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
  
    [m2 n2 ch]=size(n1);
   if ((m2 >= 30 && m2 < 100) || (n2 >= 30 && n2 < 100))
        n1=imresize(n1,[75 75]);
        out1{j}=~n1;
        if j==1
            axes(handles.axes1), imshow(~n1), %title('Detected Characters')
        elseif j==2
            axes(handles.axes2), imshow(~n1), %title('Detected Characters')
        elseif j==3
            axes(handles.axes3), imshow(~n1), %title('Detected Characters')
        elseif j==4
            axes(handles.axes4), imshow(~n1), %title('Detected Characters')
        elseif j==5
            axes(handles.axes5), imshow(~n1), %title('Detected Characters')
        elseif j==6
            axes(handles.axes6), imshow(~n1), %title('Detected Characters')
        elseif j==7
            axes(handles.axes7), imshow(~n1), %title('Detected Characters')
        elseif j==8
            axes(handles.axes8), imshow(~n1), %title('Detected Characters')
        elseif j==9
            axes(handles.axes9), imshow(~n1), %title('Detected Characters')
        elseif j==10
            axes(handles.axes10), imshow(~n1), %title('Detected Characters')
       elseif j==11
            axes(handles.axes11), imshow(~n1), %title('Detected Characters')
       elseif j==12
            axes(handles.axes12), imshow(~n1), %title('Detected Characters')
        else
            break;
        end
        
        hold on;
%         
%         im1=~n1;
%         im1= im1';
%         im1=imresize(im1,[5 7]);
%         im=im2col(im1,[1 1]);
%         
%         if j==1
%             axes(handles.axes9),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==2
%             axes(handles.axes10),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==3
%             axes(handles.axes11),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==4
%             axes(handles.axes12),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==5
%             axes(handles.axes13),  tree_Structure_model(~im), %title('Sturture Output');
%         else
%             break;
%         end
%         
        j=j+1;
        pause(0.5)
    end
end

% for n = 1: 5 %length(out1)
%     V{n}=out1{n};
%     V1=imresize(V{n},[25 25]);
%     x=Bayes(1/100,n/100,9.6/100,1)
%     pred = x;
%     if n == 1
%         set(handles.edit1,'String',num2str(pred)) ;
%     elseif n == 2
%         set(handles.edit2,'String',num2str(pred)) ;
%     elseif n == 3
%         set(handles.edit3,'String',num2str(pred)) ;
%     elseif n == 4
%         set(handles.edit4,'String',num2str(pred)) ;
%     elseif n == 5
%         set(handles.edit6,'String',num2str(pred)) ;
%     end
%     
% end

n1=out1{1};

%langModel = veterbi(n1);
 %set(handles.edit7,'String',langModel) ;
%msgbox('Recognized Characters Finished')


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
global langModel;


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ExistingAlgorithm.
% function ExistingAlgorithm_Callback(hObject, eventdata, handles)
% % hObject    handle to ExistingAlgorithm (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global imagen
% i = imagen;
% [m,n,ch]=size(i);
% if ch ==3
%     i1 = rgb2gray(i);
% else
%     i1=i;
% end
% %imshow(i1);
% axes(handles.axes14),imshow(i1),%title('INPUT IMAGE');
% 
% i2 = edge(i1,'canny',0.3);
% % imshow(i2);
% 
% se = strel('square',2);
% i3 = imdilate(i2,se);
% % imshow(i3);
% 
% i4 = imfill(i3,'holes');
% % imshow(i4);
% 
% [Ilabel num] = bwlabel(i4);
% disp(num);
% Iprops = regionprops(Ilabel);
% Ibox = [Iprops.BoundingBox];
% Ibox = reshape(Ibox,[4 num]);
% imshow(i);
% 
% hold on;
% for cnt = 1:num
%     rectangle('position',Ibox(:,cnt),'edgecolor','r');
% end
% j=1;
% L=Ilabel;
% image=imagen;
% imagen = bwNoiseReduction(imagen,8);
% for n=1:num
%     [r,c] = find(L==n);
%     n1=imagen(min(r):max(r),min(c):max(c));
%     
%     [m2 n2 ch]=size(n1);
%     if ((m2 >= 50 && m2 < 150) || (n2 >= 50 && n2 < 150))
%         n1=imresize(n1,[75 75]);
%         out1{j}=~n1;
%         if j==1
%             axes(handles.axes4), imshow(~n1), %title('Detected Characters')
%         elseif j==2
%             axes(handles.axes5), imshow(~n1), %title('Detected Characters')
%         elseif j==3
%             axes(handles.axes6), imshow(~n1), %title('Detected Characters')
%         elseif j==4
%             axes(handles.axes7), imshow(~n1), %title('Detected Characters')
%         elseif j==5
%             axes(handles.axes8), imshow(~n1), %title('Detected Characters')
%         else
%             break;
%         end
%         
%         hold on;
%         im1=~n1;
%         im1= im1';
%         im1=imresize(im1,[5 7]);
%         im=im2col(im1,[1 1]);
%         
%         if j==1
%             axes(handles.axes9),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==2
%             axes(handles.axes10),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==3
%             axes(handles.axes11),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==4
%             axes(handles.axes12),  tree_Structure_model(~im), %title('Sturture Output');
%         elseif j==5
%             axes(handles.axes13),  tree_Structure_model(~im), %title('Sturture Output');
%         else
%             break;
%         end
%         j=j+1;
%         pause(0.5)
%     end
% end
