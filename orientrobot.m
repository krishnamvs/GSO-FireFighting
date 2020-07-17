function orientrobot(fireid)
%Function that orients the robot towards the fire
%% Get neccessary information regarding the robot and fire
    global dir current_pos fire_pos robotid
    [row_fire,col_fire]=calculatepos(fire_pos(fireid));
    [row_bot,col_bot]=calculatepos(current_pos(robotid));
%% Orient the robot towards the fire. Note that the robot is next to the fire 
%and we only have to make it turn towards the fire
    if col_fire==col_bot
    %Check if robot is in the same column as fire
        if row_fire>row_bot
            %Check if fire is below of the robot
            switch dir(robotid)
                case 0
                    disp('Turning Right');
                    pause(1);
                    disp('Turning Right');
                    dir(robotid)=180;
                case 270
                    disp('Turning Left');
                    dir(robotid)=180;
                case 90
                    disp('Turning Right');
                    dir(robotid)=180;
            end
        else
            %Since the above condition fails the fire has to be above the robot
            switch dir(robotid)
                case 180
                    disp('Turning Right');
                    pause(1);
                    disp('Turning Right');
                    dir(robotid)=0;
                case 270
                    disp('Turning Right');
                    dir(robotid)=0;
                case 90
                    disp('Turning Left');
                    dir(robotid)=0;
            end
        end
    else
    %Since it is not in the same column it has to be in the same row.
        if col_fire>col_bot
            %Check if the fire is to the right of the bot
            switch dir(robotid)
                case 0
                    disp('Turning Right');
                     dir(robotid)=90;
                case 270
                    disp('Turning Left');
                    pause(1);
                    disp('Turning Left');
                     dir(robotid)=90;
                case 180
                    disp('Turning Left');
                     dir(robotid)=90;
            end
        else
            %Since the above condition fails the fire has to be to the left of the robot
            switch dir(robotid)
                case 0
                    disp('Turning Left');
                    dir(robotid)=270;
                case 90
                    disp('Turning Left');
                    pause(1);
                    disp('Turning Left');
                    dir(robotid)=270;
                case 180
                    disp('Turning Right');
                    dir(robotid)=270;
            end
        end
    end
    pause(1);
end