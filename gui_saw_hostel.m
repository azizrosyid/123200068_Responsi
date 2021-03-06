function varargout = gui_saw_hostel(varargin)
% GUI_SAW_HOSTEL MATLAB code for gui_saw_hostel.fig
%      GUI_SAW_HOSTEL, by itself, creates a new GUI_SAW_HOSTEL or raises the existing
%      singleton*.
%
%      H = GUI_SAW_HOSTEL returns the handle to a new GUI_SAW_HOSTEL or the handle to
%      the existing singleton*.
%
%      GUI_SAW_HOSTEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SAW_HOSTEL.M with the given input arguments.
%
%      GUI_SAW_HOSTEL('Property','Value',...) creates a new GUI_SAW_HOSTEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_saw_hostel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_saw_hostel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_saw_hostel

% Last Modified by GUIDE v2.5 18-May-2022 14:37:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_saw_hostel_OpeningFcn, ...
    'gui_OutputFcn',  @gui_saw_hostel_OutputFcn, ...
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


% --- Executes just before gui_saw_hostel is made visible.
function gui_saw_hostel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_saw_hostel (see VARARGIN)

% Choose default command line output for gui_saw_hostel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global cityPicked;
cityPicked = ["Fukuoka-City"];
% UIWAIT makes gui_saw_hostel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_saw_hostel_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function datasetTable_068_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datasetTable_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global cityPicked;
dataset = get_dataset(cityPicked);
datasetCell = table2cell(dataset);
set(hObject, 'Data', datasetCell);
set(hObject, 'ColumnName', dataset.Properties.VariableNames);


% --- Executes on button press in btnHitung_068.
function btnHitung_068_Callback(hObject, eventdata, handles)
% hObject    handle to btnHitung_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cityPicked;
result = saw_hostel(cityPicked);
result = removevars(result, ["City" "summary_score" "rating_band" "atmosphere" "facilities" "location_y" "security" "staff"]);
set(handles.resultTable_068, 'Data', table2cell(result));
set(handles.resultTable_068, 'ColumnName', result.Properties.VariableNames);
set(handles.bestHostel_068, 'String', result.hostel_name(1));

function checkBoxListener(checkBox, handles)
global cityPicked;
if (checkBox.Value == 1)
    cityPicked(end + 1) = checkBox.String;
else
    cityPicked(strcmp(cityPicked, checkBox.String)) = [];
end

dataset = get_dataset(cityPicked);
set(handles.datasetTable_068, 'Data', table2cell(dataset));

% --- Executes on button press in fukuoka_068.
function fukuoka_068_Callback(hObject, eventdata, handles)
% hObject    handle to fukuoka_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fukuoka_068
checkBoxListener(hObject, handles);

% --- Executes on button press in hiroshima_068.
function hiroshima_068_Callback(hObject, eventdata, handles)
% hObject    handle to hiroshima_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hiroshima_068
checkBoxListener(hObject, handles);

% --- Executes on button press in Kyoto_068.
function Kyoto_068_Callback(hObject, eventdata, handles)
% hObject    handle to Kyoto_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Kyoto_068
checkBoxListener(hObject, handles);

% --- Executes on button press in Osaka_068.
function Osaka_068_Callback(hObject, eventdata, handles)
% hObject    handle to Osaka_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Osaka_068
checkBoxListener(hObject, handles);

% --- Executes on button press in Tokyo_068.
function Tokyo_068_Callback(hObject, eventdata, handles)
% hObject    handle to Tokyo_068 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Tokyo_068
checkBoxListener(hObject, handles);
