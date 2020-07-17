function [x,y]=getvertices(verticesflag,pos)
%Function that gets a x and y vertices data where the  flag which
%basically tells if its a square or the orientation of the triangle and
%the position in the grid 
    global xverticesdata yverticesdata;
    [rowid,colid]=calculatepos(pos);
    %Since x and y is inverted we have to do the below circus.xD
    tempx=xverticesdata{colid};
    tempy=yverticesdata{rowid};
    switch verticesflag
        case 360 %For Square
            x=tempx;
            y=tempy;

        case 0 %For Upward Triangle
            x=[tempx(1) tempx(2) (tempx(3)+tempx(4))/2];
            y=[tempy(1) tempy(2) (tempy(3)+tempy(4))/2];

        case 180 %For Downward Triangle
            x=[(tempx(1)+tempx(2))/2 tempx(3) tempx(4)];
            y=[(tempy(1)+tempy(2))/2 tempy(3) tempy(4)];

        case 90 %For Rightward Triangle
            x=[tempx(1) (tempx(2)+tempx(3))/2 tempx(4)];
            y=[tempy(1) (tempy(2)+tempy(3))/2 tempy(4)];

        case 270 %For Leftward Triangle
            x=[(tempx(1)+tempx(4))/2 tempx(2) tempx(3) ];
            y=[(tempy(1)+tempy(4))/2 tempy(2) tempy(3) ];

    end
end

