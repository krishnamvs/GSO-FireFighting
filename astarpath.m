function OptimalPath=astarpath(fire_no,initial_pos,obs_rbt_pos)
global envdata fire_pos objdata;
tempmap=envdata+objdata;
for i=1:length(fire_pos)
    tempmap(fire_pos(i))=1;
end
tempmap(fire_pos(fire_no))=0;
if nargin==3
    tempmap(obs_rbt_pos)=1;
end
[row_bot,col_bot]=calculatepos(initial_pos);
[row_fire,col_fire]=calculatepos(fire_pos(fire_no));
[Height,Width]=size(tempmap); %Height and width of matrix
GScore=zeros(Height,Width);   %Matrix keeping track of G-scores 
FScore=inf(Height,Width);     %Matrix keeping track of F-scores (only open list) 
Hn=zeros(Height,Width);       %Heuristic matrix
OpenMAT=zeros(Height,Width);  %Matrix keeping of open grid cells
ClosedMAT=zeros(Height,Width);%Matrix keeping track of closed grid cells
ClosedMAT(tempmap==1)=1;      %Adding object-cells to closed matrix
ParentX=zeros(Height,Width);  %Matrix keeping track of X position of parent
ParentY=zeros(Height,Width);  %Matrix keeping track of Y position of parent
turn=0;
%% Setting up matrices representing neighboors to be investigated
NeighboorCheck=ones(3);
NeighboorCheck(2,2)=0;
NeighboorCheck(1,1)=0;
NeighboorCheck(1,3)=0;
NeighboorCheck(3,1)=0;
NeighboorCheck(3,3)=0;
[row, col]=find(NeighboorCheck==1);
Neighboors=[row col]-2;
N_Neighboors=size(col,1);
% End of setting up matrices representing neighboors to be investigated
%% Creating Heuristic-matrix based on distance to nearest fire node
RegisteredFire=[row_fire col_fire];
for k=1:10
    for j=1:10
        if tempmap(k,j)==0
            Mat=RegisteredFire-(repmat([j k],1,1));
            Distance=(min(sqrt(sum(abs(Mat).^2,2))))*0.4;
            Hn(k,j)=Distance;
        end
    end
end
%End of creating Heuristic-matrix
%% Initializign start node with FValue and opening first node.
FScore(row_bot,col_bot)=Hn(row_bot,col_bot);         
OpenMAT(row_bot,col_bot)=1;   
while 1==1 %Code will break when path found or when no path exist
    MINopenFSCORE=min(min(FScore));
    if MINopenFSCORE==inf
        %No path to fire
        OptimalPath=inf;
        RECONSTRUCTPATH=0;
        break
    end
    [CurrentY,CurrentX]=find(FScore==MINopenFSCORE);
    CurrentY=CurrentY(1);
    CurrentX=CurrentX(1);
    if [CurrentY,CurrentX]==[row_fire,col_fire]
        %Path to fire exists
        RECONSTRUCTPATH=1;
        break
    end
    %Removing node from OpenList to ClosedList  
    OpenMAT(CurrentY,CurrentX)=0;
    FScore(CurrentY,CurrentX)=inf;
    ClosedMAT(CurrentY,CurrentX)=1;
    for p=1:N_Neighboors
        i=Neighboors(p,1); %Y
        j=Neighboors(p,2); %X
        if CurrentY+i<1||CurrentY+i>Height||CurrentX+j<1||CurrentX+j>Width
            continue
        end
        Flag=1;
        if(ClosedMAT(CurrentY+i,CurrentX+j)==0) %Neiboor is open;
            if (abs(i)>1||abs(j)>1)   
                % Need to check that the path does not pass an object
                JumpCells=2*max(abs(i),abs(j))-1;
                for K=1:JumpCells
                    YPOS=round(K*i/JumpCells);
                    XPOS=round(K*j/JumpCells);
            
                    if (tempmap(CurrentY+YPOS,CurrentX+XPOS)==1)
                        Flag=0;
                    end
                end
            end
             %End of  checking that the path does not pass an object
            if Flag==1          
                tentative_gScore = GScore(CurrentY,CurrentX) + sqrt(i^2+j^2);
                if OpenMAT(CurrentY+i,CurrentX+j)==0
                    OpenMAT(CurrentY+i,CurrentX+j)=1;                    
                elseif tentative_gScore >= GScore(CurrentY+i,CurrentX+j)
                    continue
                end
                ParentX(CurrentY+i,CurrentX+j)=CurrentX;
                ParentY(CurrentY+i,CurrentX+j)=CurrentY;
                if i==0
                    turn=turn+1;
                    tentative_gScore=tentative_gScore+(2*0.4).^turn;
                end
                GScore(CurrentY+i,CurrentX+j)=tentative_gScore;
                FScore(CurrentY+i,CurrentX+j)= tentative_gScore+Hn(CurrentY+i,CurrentX+j);
            end
        end
    end
end
%End of Finding Shortest Path with least turns.
%% Reconstruction of path in terms of positions
if RECONSTRUCTPATH
    k=1;
    OptimalPath(k,:)=[CurrentY,CurrentX];
    while RECONSTRUCTPATH
        CurrentXDummy=ParentX(CurrentY,CurrentX);
        CurrentY=ParentY(CurrentY,CurrentX);
        CurrentX=CurrentXDummy;
        OptimalPath(k,:)=[CurrentY,CurrentX];
        k=k+1;
        if (((CurrentX== col_bot)) &&(CurrentY==row_bot))
            break
        end
    end
end
%End of Shortest Path Reconstruction.
%% Flipping the OptimalPath since the path is being calculated from endpoint to start point.
OptimalPath=flip(OptimalPath);
end