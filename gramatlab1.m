function varargout = gramatlab(varargin)
% GRAMATLAB MATLAB code for gramatlab.fig
%      GRAMATLAB, by itself, creates a new GRAMATLAB or raises the existing
%      singleton*.
%
%      H = GRAMATLAB returns the handle to a new GRAMATLAB or the handle to
%      the existing singleton*.
%
%      GRAMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAMATLAB.M with the given input arguments.
%
%      GRAMATLAB('Property','Value',...) creates a new GRAMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gramatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gramatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gramatlab

% Last Modified by GUIDE v2.5 10-Jun-2017 13:03:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gramatlab_OpeningFcn, ...
                   'gui_OutputFcn',  @gramatlab_OutputFcn, ...
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


% --- Executes just before gramatlab is made visible.
function gramatlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gramatlab (see VARARGIN)
ha=axes('position',[0 0 1 1]);
uistack(ha,'bottom');
A=imread('tlo.jpg');
imagesc(A);
set(ha,'handlevisibility','off','visible','off'); 
set(handles.circle,'Value',1);
set(handles.komputer,'Value',1);
% Choose default command line output for gramatlab
handles.output = hObject;
set(hObject, 'Name', 'Kó³ko i krzy¿yk');
handles.q=zeros(1,9)
        
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gramatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gramatlab_OutputFcn(hObject, eventdata, handles) 
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
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,1)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,1)==handles.q(1,2) && handles.q(1,1)==handles.q(1,3) && handles.q(1,2)==handles.q(1,3)
        wygrana(1,2,3,handles.q,handles.text2,handles);
    elseif handles.q(1,1)==handles.q(1,5) && handles.q(1,1)==handles.q(1,9) && handles.q(1,5)==handles.q(1,9)
        wygrana(1,5,9,handles.q,handles.text2,handles);
    elseif handles.q(1,1)==handles.q(1,4) && handles.q(1,1)==handles.q(1,7) && handles.q(1,4)==handles.q(1,7)
        wygrana(1,4,7,handles.q,handles.text2,handles);
    else %gra z komputerem
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)]);
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,1)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(1,2,3,handles.q,handles.text2,handles);
    wygrana(1,5,9,handles.q,handles.text2,handles);
    wygrana(1,4,7,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,2)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,1)==handles.q(1,2) && handles.q(1,1)==handles.q(1,3) && handles.q(1,2)==handles.q(1,3)
        wygrana(1,2,3,handles.q,handles.text2,handles);
    elseif handles.q(1,2)==handles.q(1,5) && handles.q(1,1)==handles.q(1,8) && handles.q(1,5)==handles.q(1,8)
        wygrana(2,5,8,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,2)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(1,2,3,handles.q,handles.text2,handles);
    wygrana(2,5,8,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,3)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,1)==handles.q(1,2) && handles.q(1,1)==handles.q(1,3) && handles.q(1,2)==handles.q(1,3)
        wygrana(1,2,3,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,5) && handles.q(1,3)==handles.q(1,7) && handles.q(1,5)==handles.q(1,7)
        wygrana(3,5,7,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,6) && handles.q(1,3)==handles.q(1,9) && handles.q(1,6)==handles.q(1,9)
        wygrana(3,6,9,handles.q,handles.text2,handles);
    else    
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,3)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(1,2,3,handles.q,handles.text2,handles);
    wygrana(3,5,7,handles.q,handles.text2,handles);
    wygrana(3,6,9,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,4)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,4)==handles.q(1,5) && handles.q(1,4)==handles.q(1,6) && handles.q(1,5)==handles.q(1,6)
        wygrana(4,5,6,handles.q,handles.text2,handles);
    elseif handles.q(1,1)==handles.q(1,4) && handles.q(1,1)==handles.q(1,7) && handles.q(1,4)==handles.q(1,7)
        wygrana(1,4,7,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,4)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(4,5,6,handles.q,handles.text2,handles);
    wygrana(1,4,7,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,5)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,4)==handles.q(1,5) && handles.q(1,4)==handles.q(1,6) && handles.q(1,5)==handles.q(1,6)
        wygrana(4,5,6,handles.q,handles.text2,handles);
    elseif handles.q(1,1)==handles.q(1,5) && handles.q(1,1)==handles.q(1,9) && handles.q(1,5)==handles.q(1,9)
        wygrana(1,5,9,handles.q,handles.text2,handles);
    elseif handles.q(1,2)==handles.q(1,5) && handles.q(1,2)==handles.q(1,8) && handles.q(1,5)==handles.q(1,8)
        wygrana(2,5,8,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,5) && handles.q(1,3)==handles.q(1,7) && handles.q(1,5)==handles.q(1,7)
        wygrana(3,5,7,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,5)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(4,5,6,handles.q,handles.text2,handles);
    wygrana(1,5,9,handles.q,handles.text2,handles);
    wygrana(2,5,8,handles.q,handles.text2,handles);
    wygrana(3,5,7,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,6)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,4)==handles.q(1,5) && handles.q(1,4)==handles.q(1,6) && handles.q(1,5)==handles.q(1,6)
        wygrana(4,5,6,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,6) && handles.q(1,3)==handles.q(1,9) && handles.q(1,6)==handles.q(1,9)
        wygrana(3,6,9,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,6)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(4,5,6,handles.q,handles.text2,handles);
    wygrana(3,6,9,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,7)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,7)==handles.q(1,8) && handles.q(1,7)==handles.q(1,9) && handles.q(1,8)==handles.q(1,9)
        wygrana(7,8,9,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,5) && handles.q(1,3)==handles.q(1,7) && handles.q(1,5)==handles.q(1,7)
        wygrana(3,5,7,handles.q,handles.text2,handles);
    elseif handles.q(1,1)==handles.q(1,4) && handles.q(1,1)==handles.q(1,7) && handles.q(1,4)==handles.q(1,7)
        wygrana(1,4,7,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1
                c=eval(['handles.pushbutton' int2str(i)])
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,7)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(7,8,9,handles.q,handles.text2,handles);
    wygrana(3,5,7,handles.q,handles.text2,handles);
    wygrana(1,4,7,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,8)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,7)==handles.q(1,8) && handles.q(1,7)==handles.q(1,9) && handles.q(1,8)==handles.q(1,9)
        wygrana(7,8,9,handles.q,handles.text2,handles);
    elseif handles.q(1,2)==handles.q(1,5) && handles.q(1,2)==handles.q(1,8) && handles.q(1,5)==handles.q(1,8)
        wygrana(2,5,8,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,8)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(7,8,9,handles.q,handles.text2,handles);
    wygrana(2,5,8,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
e=get(handles.komputer,'Value');
k = get(handles.circle,'Value');
if k
    set(hObject,'String', 'O');
    handles.q(1,9)=1;
    set(hObject,'Enable','off');
    set(handles.cross, 'Value', 1);
    if handles.q(1,1)==handles.q(1,5) && handles.q(1,1)==handles.q(1,9) && handles.q(1,5)==handles.q(1,9)
        wygrana(1,5,9,handles.q,handles.text2,handles);
    elseif handles.q(1,3)==handles.q(1,6) && handles.q(1,3)==handles.q(1,9) && handles.q(1,6)==handles.q(1,9)
        wygrana(3,6,9,handles.q,handles.text2,handles);
    elseif handles.q(1,7)==handles.q(1,8) && handles.q(1,7)==handles.q(1,9) && handles.q(1,8)==handles.q(1,9)
        wygrana(7,8,9,handles.q,handles.text2,handles);
    else
        if e
            [y,p]=komp(1,handles.q,handles.pushbutton1,handles.pushbutton2,handles.pushbutton3,handles.pushbutton4,handles.pushbutton5,handles.pushbutton6,handles.pushbutton7,handles.pushbutton8,handles.pushbutton9)
            if p>0
                handles.q(1,p)=2;
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            if y==0
                i=(9-1)*rand(1,1)+1;
                c=eval(['handles.pushbutton' int2str(i)]);
                if get(c,'String')~=' '
                    i=1;
                    c=eval(['handles.pushbutton' int2str(i)]);
                    while get(c,'String')~=' ' 
                        i=i+1;
                        c=eval(['handles.pushbutton' int2str(i)]);
                        if i>=9
                            break
                        end
                    end
                end
                c=eval(['handles.pushbutton' int2str(i)])
                pause(1);
                set(c,'String','X');
                handles.q(1,round(i))=2;
                set(c,'Enable','off');
            end
            wygrana(1,2,3,handles.q,handles.text2,handles);
            wygrana(1,5,9,handles.q,handles.text2,handles);
            wygrana(4,5,6,handles.q,handles.text2,handles);
            wygrana(1,4,7,handles.q,handles.text2,handles);
            wygrana(2,5,8,handles.q,handles.text2,handles);
            wygrana(3,6,9,handles.q,handles.text2,handles);
            wygrana(3,5,7,handles.q,handles.text2,handles);
            wygrana(7,8,9,handles.q,handles.text2,handles);
            set(handles.circle, 'Value', 1);
        end
    end
else
    set(hObject,'String', 'X')
    handles.q(1,9)=2;
    set(hObject,'Enable','off');
    set(handles.circle, 'Value', 1);
    wygrana(1,5,9,handles.q,handles.text2,handles);
    wygrana(3,6,9,handles.q,handles.text2,handles);
    wygrana(7,8,9,handles.q,handles.text2,handles);
end
handles.q
guidata(hObject, handles);

% --- Executes on button press in new.
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2,'String', ' ')
for i=1:9
    set(eval(['handles.pushbutton' int2str(i)]),'Enable','on');
    set(eval(['handles.pushbutton' int2str(i)]),'String', ' ');
    set(eval(['handles.pushbutton' int2str(i)]), 'BackgroundColor', 'white');
    handles.q(1,i)=0;
end
handles.q
if get(handles.komputer,'Value')~=1
    if get(handles.cross, 'Value')==1
        i=(9-1)*rand(1,1)+1;
        c=eval(['handles.pushbutton' int2str(i)]);
        pause(1);
        set(c,'String','X');
        handles.q(1,round(i))=2;
        set(c,'Enable','off');
        set(handles.circle, 'Value', 1);
    end
end
guidata(hObject, handles);


function wygrana(a,b,c,f,d,handles)
    if f(1,a)==1 && f(1,b)==1 && f(1,c)==1
        set(d,'String','Wygrywa O!')
        for i=[a,b,c]
            set(eval(['handles.pushbutton' int2str(i)]), 'BackgroundColor', 'green')
        end
        for i=1:9
            set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
        end
    elseif f(1,a)==2 && f(1,b)==2 && f(1,c)==2
        set(d,'String','Wygrywa X!')
        for i=[a, b, c]
            set(eval(['handles.pushbutton' int2str(i)]), 'BackgroundColor', 'green');
        end
        for i=1:9
            set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
        end
    end
    %guidata(hObject, handles);
    
    
    
    function [y,p]=komp(a,d,w1,w2,w3,w4,w5,w6,w7,w8,w9)
        p=0;
        y=0;
        if a==1
            for v=[2,1]
                v
                if ((d(1,1)==d(1,2) && d(1,1)~=0 && d(1,2)~=0 && d(1,1)==v && d(1,2)==v) || (d(1,5)==d(1,7) && d(1,5)~=0 && d(1,7)~=0 && d(1,7)==v && d(1,5)==v) || (d(1,6)==d(1,9) && d(1,6)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,6)==v)) && get(w3,'String')==' '
                    pause(1)
                    set(w3,'String','X');
                    y=1;
                    p=3;
                    set(w3,'Enable','off');
                elseif y==0
                    if ((d(1,1)==d(1,3) && d(1,1)~=0 && d(1,3)~=0 && d(1,1)==v && d(1,3)==v) || (d(1,5)==d(1,8) && d(1,5)~=0 && d(1,8)~=0 && d(1,8)==v && d(1,5)==v)) && get(w2,'String')==' '
                        pause(1)
                        set(w2,'String','X');
                        y=1;
                        p=2;
                        set(w2,'Enable','off');
                    elseif y==0
                        if ((d(1,1)==d(1,5) && d(1,1)~=0 && d(1,5)~=0 && d(1,1)==v && d(1,5)==v) || (d(1,7)==d(1,8) && d(1,7)~=0 && d(1,8)~=0 && d(1,8)==v && d(1,7)==v) || (d(1,6)==d(1,3) && d(1,6)~=0 && d(1,3)~=0 && d(1,3)==v && d(1,6)==v)) && get(w9,'String')==' '
                            pause(1)
                            set(w9,'String','X');  
                            y=1;
                            p=9;
                            set(w9,'Enable','off');
                        elseif y == 0
                            if ((d(1,1)==d(1,9) && d(1,1)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,1)==v) || (d(1,2)==d(1,8) && d(1,2)~=0 && d(1,8)~=0 && d(1,2)==v && d(1,8)==v) || (d(1,7)==d(1,3) && d(1,7)~=0 && d(1,3)~=0 && d(1,3)==v && d(1,7)==v) || (d(1,4)==d(1,6) && d(1,4)~=0 && d(1,6)~=0 && d(1,6)==v && d(1,4)==v)) && get(w5,'String')==' '
                                pause(1)
                                set(w5,'String','X');
                                y=1;
                                p=5;
                                set(w5,'Enable','off');
                            elseif y==0
                                if ((d(1,1)==d(1,4) && d(1,1)~=0 && d(1,4)~=0 && d(1,1)==v && d(1,4)==v) || (d(1,5)==d(1,3) && d(1,5)~=0 && d(1,3)~=0 && d(1,3)==v && d(1,5)==v) || (d(1,8)==d(1,9) && d(1,8)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,8)==v)) && get(w7,'String')==' '
                                    pause(1)
                                    set(w7,'String','X');
                                    y=1;
                                    p=7;
                                    set(w7,'Enable','off');
                                elseif y==0
                                    if ((d(1,1)==d(1,7) && d(1,1)~=0 && d(1,7)~=0 && d(1,1)==v && d(1,7)==v) || (d(1,5)==d(1,6) && d(1,5)~=0 && d(1,6)~=0 && d(1,5)==v && d(1,6)==v)) && get(w4,'String')==' '
                                        pause(1)
                                        set(w4,'String','X');
                                        y=1;
                                        p=4;
                                        set(w4,'Enable','off');
                                    elseif y==0
                                        if ((d(1,2)==d(1,5) && d(1,2)~=0 && d(1,5)~=0 && d(1,5)==v && d(1,2)==v) || (d(1,7)==d(1,9) && d(1,7)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,7)==v)) && get(w8,'String')==' '
                                            pause(1)
                                            set(w8,'String','X');
                                            y=1;
                                            p=8;
                                            set(w8,'Enable','off');
                                        elseif y==0
                                            if ((d(1,3)==d(1,9) && d(1,3)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,3)==v) || (d(1,4)==d(1,5) && d(1,4)~=0 && d(1,5)~=0 && d(1,4)==v && d(1,5)==v)) && get(w6,'String')==' '
                                                pause(1)
                                                set(w6,'String','X');
                                                y=1;
                                                p=6;   
                                                set(w6,'Enable','off'); 
                                            elseif y==0
                                                if ((d(1,2)==d(1,3) && d(1,2)~=0 && d(1,3)~=0 && d(1,3)==v && d(1,2)==v) || (d(1,5)==d(1,9) && d(1,5)~=0 && d(1,9)~=0 && d(1,9)==v && d(1,5)==v) || (d(1,4)==d(1,7) && d(1,4)~=0 && d(1,7)~=0 && d(1,7)==v && d(1,4)==v)) && get(w1,'String')==' '
                                                    pause(1)
                                                    set(w1,'String','X')
                                                    y=1;
                                                    p=1;
                                                    set(w1,'Enable','off');
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    
        
   