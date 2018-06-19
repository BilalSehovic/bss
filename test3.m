function varargout = test3(varargin)
% TEST3 MATLAB code for test3.fig
%      TEST3, by itself, creates a new TEST3 or raises the existing
%      singleton*.
%
%      H = TEST3 returns the handle to a new TEST3 or the handle to
%      the existing singleton*.
%
%      TEST3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST3.M with the given input arguments.
%
%      TEST3('Property','Value',...) creates a new TEST3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test3

% Last Modified by GUIDE v2.5 19-Jun-2018 01:31:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test3_OpeningFcn, ...
                   'gui_OutputFcn',  @test3_OutputFcn, ...
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


% --- Executes just before test3 is made visible.
function test3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test3 (see VARARGIN)

% Choose default command line output for test3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% listbox1 popunjavanje
listboxopts = cell(70,1);
for i=1:70
    listboxopts{i} = ['data-' num2str([i:i].','%02d')];
end
set(handles.listbox1, 'string', listboxopts);
% listbox2 popunjavanje

% 33 = Regular insulin dose 
% 34 = NPH insulin dose 
% 35 = UltraLente insulin dose 
% 48 = Unspecified blood glucose measurement 
% 57 = Unspecified blood glucose measurement 
% 58 = Pre-breakfast blood glucose measurement 
% 59 = Post-breakfast blood glucose measurement 
% 60 = Pre-lunch blood glucose measurement 
% 61 = Post-lunch blood glucose measurement 
% 62 = Pre-supper blood glucose measurement 
% 63 = Post-supper blood glucose measurement 
% 64 = Pre-snack blood glucose measurement 
% 65 = Hypoglycemic symptoms 
% 66 = Typical meal ingestion 
% 67 = More-than-usual meal ingestion 
% 68 = Less-than-usual meal ingestion 
% 69 = Typical exercise activity 
% 70 = More-than-usual exercise activity 
% 71 = Less-than-usual exercise activity 
% 72 = Unspecified special event

listboxcodes = cell(20,1);
listboxcodes{1} = '33 = Regular insulin dose';
listboxcodes{2} = '34 = NPH insulin dose';
listboxcodes{3} = '35 = UltraLente insulin dose';
listboxcodes{4} = '48 = Unspecified blood glucose measurement';
listboxcodes{5} = '57 = Unspecified blood glucose measurement';
listboxcodes{6} = '58 = Pre-breakfast blood glucose measurement';
listboxcodes{7} = '59 = Post-breakfast blood glucose measurement';
listboxcodes{8} = '60 = Pre-lunch blood glucose measurement';
listboxcodes{9} = '61 = Post-lunch blood glucose measurement';
listboxcodes{10} = '62 = Pre-supper blood glucose measurement';
listboxcodes{11} = '63 = Post-supper blood glucose measurement';
listboxcodes{12} = '64 = Pre-snack blood glucose measurement';
listboxcodes{13} = '65 = Hypoglycemic symptoms';
listboxcodes{14} = '66 = Typical meal ingestion';
listboxcodes{15} = '67 = More-than-usual meal ingestion';
listboxcodes{16} = '68 = Less-than-usual meal ingestion';
listboxcodes{17} = '69 = Typical exercise activity';
listboxcodes{18} = '70 = More-than-usual exercise activity';
listboxcodes{19} = '71 = Less-than-usual exercise activity';
listboxcodes{20} = '72 = Unspecified special event';

set(handles.listbox2, 'string', listboxcodes);

% listbox3 popunjavanje - datumi
listbox3_refresh(hObject, eventdata, handles)


% --- Outputs from this function are returned to the command line.
function varargout = test3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
disp('*************listbox1_Callback*************');
index_selected = get(handles.listbox1,'Value');
file_list = get(handles.listbox1,'String');
filename = file_list{index_selected};
filename = ['Diabetes-Data\' filename];
disp(filename);
data = readtable(filename, 'Delimiter', '\t', 'ReadVariableNames', false, 'ReadRowNames', false);
figure;
t = linspace(0,length(data.Var3),length(data.Var3))';
plot(t, data.Var3);
listbox3_refresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('*************pushbutton1_Callback*************');
index_selected = get(handles.listbox1,'Value');
file_list = get(handles.listbox1,'String');
filename = file_list{index_selected};
filename = ['Diabetes-Data\' filename];
disp(filename);
data = readtable(filename, 'Delimiter', '\t', 'ReadVariableNames', false, 'ReadRowNames', false);
figure;
% t = linspace(0,length(data.Var3),length(data.Var3))';
% plot(t, data.Var3);
histogram(data{:,3}, 'BinLimits',[30,70]);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('*************pushbutton2_Callback*************');
% uzmi odabran kod
selectedcode = getOdabraniKod(hObject, eventdata, handles);
% uzmi odabran dataset
data = getOdabranaData(hObject, eventdata, handles);
figure;
% t = linspace(0,length(data.Var3),length(data.Var3))';
% plot(t, data.Var3);
histogram(data{data.Var3==selectedcode,4});

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [data] = getOdabranaData(hObject, eventdata, handles)
disp('*************getOdabranaData*************');
% uzmi odabran dataset
index_selected = get(handles.listbox1,'Value');
file_list = get(handles.listbox1,'String');
filename = file_list{index_selected};
filename = ['Diabetes-Data\' filename];
disp(filename);
data = readtable(filename, 'Delimiter', '\t', 'ReadVariableNames', false, 'ReadRowNames', false);

function [kod] = getOdabraniKod(hObject, eventdata, handles)
disp('*************getOdabraniKod*************');
% uzmi odabran kod
index_listbox2 = get(handles.listbox2,'Value');
listbox2_list = get(handles.listbox2,'String');
selected = listbox2_list{index_listbox2};
disp(selected);
kod = str2double(selected(1:3));

function [datum] = getOdabraniDatum(hObject, eventdata, handles, offset)
disp('*************getOdabraniDatum*************');
index_selected = get(handles.listbox3,'Value');
file_list = get(handles.listbox3,'String');
datum = file_list{index_selected};
if offset == -1 && index_selected-1 > 0
    datum = file_list{index_selected-1};
end
if offset == 1 && index_selected+1 < length(file_list)
    datum = file_list{index_selected+1};
end


function listbox3_refresh(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('*************listbox3_refresh*************');
index_selected = get(handles.listbox1,'Value');
file_list = get(handles.listbox1,'String');
filename = file_list{index_selected};
filename = ['Diabetes-Data\' filename];
data = readtable(filename, 'Delimiter', '\t', 'ReadVariableNames', false, 'ReadRowNames', false);

listboxdates = unique(data.Var1);
set(handles.listbox3, 'string', listboxdates);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datum = getOdabraniDatum(hObject, eventdata, handles, 0);
data = getOdabranaData(hObject, eventdata, handles);
kod = getOdabraniKod(hObject, eventdata, handles);

odabranDan = data(datenum(data.Var1)==datenum(datum, 'mm-dd-yyyy') & data.Var3==kod,:);
disp(odabranDan);

if get(handles.checkbox2,'Value')==0
    figure;
    dn=datenum(char(odabranDan{:,2}),'HH:MM');
    stem(dn,odabranDan{:,4});
    datetick('x', 'HH:MM', 'keepticks', 'keeplimits');
    title(datum);
else
    datumminus = getOdabraniDatum(hObject, eventdata, handles, -1);
    datumplus = getOdabraniDatum(hObject, eventdata, handles, 1);
    danNazad = data(datenum(data.Var1)==datenum(datumminus, 'mm-dd-yyyy') & data.Var3==kod,:);
    danNaprijed = data(datenum(data.Var1)==datenum(datumplus, 'mm-dd-yyyy') & data.Var3==kod,:);
    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1);
    dn=datenum(char(danNazad{:,2}),'HH:MM');
    stem(dn,danNazad{:,4});
    datetick('x', 'HH:MM', 'keepticks');
    title(datumminus);

    subplot(1,3,2);
    dn=datenum(char(odabranDan{:,2}),'HH:MM');
    stem(dn,odabranDan{:,4});
    datetick('x', 'HH:MM', 'keepticks');
    title(datum);
    
    subplot(1,3,3);
    dn=datenum(char(danNaprijed{:,2}),'HH:MM');
    stem(dn,danNaprijed{:,4});
    datetick('x', 'HH:MM', 'keepticks');
    title(datumplus);
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
