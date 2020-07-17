%% Initialization of Workspace
cc
global ax nr nf xverticesdata yverticesdata step_distance robotip robotid ... 
initial_pos dir fire_pos current_pos distance envdata colors objdata ...
patch_holder reachedflag fire_assignment stack decay threshold;
ax=axes('XLim',[0 4],'YLim',[0 4],'XTick',linspace(0,4,11), ...
'YTick',linspace(0,4,11),'Box','on');
grid on;
patch_holder=cell(10);
nr=3;%No:of Robots
decay=0.1;%Linear Decay
colors={'green' 'yellow' 'blue'};
xverticesdata={[0 0.4 0.4 0],[0.4 0.8 0.8 0.4],[0.8 1.2 1.2 0.8],...
    [1.2 1.6 1.6 1.2],[1.6 2.0 2.0 1.6],[2.0 2.4 2.4 2.0],...
    [2.4 2.8 2.8 2.4],[2.8 3.2 3.2 2.8],[3.2 3.6 3.6 3.2],[3.6 4.0 4.0 3.6]};
yverticesdata={[3.6 3.6 4 4],[3.2 3.2 3.6 3.6],[2.8 2.8 3.2 3.2],...
    [2.4 2.4 2.8 2.8],[2.0 2.0 2.4 2.4],[1.6 1.6 2.0 2.0],...
    [1.2 1.2 1.6 1.6],[0.8 0.8 1.2 1.2],[0.4 0.4 0.8 0.8],[0 0 0.4 0.4]};
%Sample Map
envdata=zeros(10);
objdata=zeros(10);
envdata(12:19)=1;
envdata(32:39)=1;
envdata(52:59)=1;
envdata(72:10:82)=1;
envdata(74:10:84)=1;
envdata(76:10:86)=1;
putmap;
step_distance=0.4;
robotip={'robot1ip' 'robot2ip' 'robot3ip'};
robotid=0;
initial_pos=[0 0 0];
dir=[0 0 0];
fire_pos=[];
distance=[0 0 0];
fire_assignment=[0 0 0];
stack=cell(1,nr);
threshold=[50 50 50];
for i=1:nr
   is=num2str(i);
   initial_pos(i)=input(strcat('Enter the Initial Position of Robot',is,' :- '));
   dir(i)=input(strcat('Enter the Orientation of Robot',is,' :- '));
end
current_pos=initial_pos;
putrobotpatch;
%%
option=input('Do you want to enter information about fire position? [y,n] :- ');
if strcmp(option,'y')
    init;
    tic
    fire_assignment=zeros(1,nf);
    assign_robot2fire;
    while(~all(reachedflag))
%         update_env;
%         checkvalidityfirepos;
        followpath(1);
        pause(1);
    end
    toc
%   while(any(reachedflag(1:nf))
%       checkfirestatus;
%       pause(3);
%   end
    clearmap;
    reachedflag=zeros(1,nf);
    getpathtointialpos;
    disp('Begining to go backto Initial Positions');
    while(~all(reachedflag))
         followpath(0);
         pause(1);
    end
    clearmap;
    disp('Complete');
%     update_lucifermin
     option=input('Do you want to enter information about position? [y,n] :- ');
end