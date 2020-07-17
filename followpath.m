function followpath(f1)
%Function follows the path determined by the a star path planner.
global nf robotid current_pos step_distance distance dir reachedflag fire_assignment stack
%% Getting the X and Y coordinates of Fire and Robot Location
    for i=1:nf
        robotid=fire_assignment(i);
        pos=current_pos(robotid);
        if reachedflag(i)
          continue
        end
        if eq(size(stack{robotid},1),1)
            c_pos=stack{robotid}(1,:);
            disp('Reached Fire Position');
            disp(current_pos(robotid));
            reachedflag(i)=1;
            if f1
                orientrobot(i);
                disp('Fire Extinguisher On');
            end
            updaterobotpatch(i,c_pos,dir(robotid));
        else
            % Moving the Robot closer to the Fire Location
            c_pos=stack{robotid}(1,:);
            n_pos=stack{robotid}(2,:);
            nextpos=n_pos(1)+((n_pos(2)-1)*10);
            if any(current_pos==nextpos)
                tr=find(current_pos==nextpos);
                if reachedflag(fire_assignment==tr)
                    stack{robotid}=astarpath(i,current_pos(robotid),nextpos);
                    disp('Changing Path');
                else
                    disp('Skipping Movement');
                end
                continue;
            end
            moveflag=0;
            stack{robotid}(1,:)=[];
            while(not(moveflag))
                d=dir(robotid);
                switch d
                    case 0
                        if eq(n_pos(1),c_pos(1))
                            if n_pos(2)<c_pos(2)
                                disp('Turning Left');
                                dir(robotid)=270;
                                %Send /L command 
                            elseif n_pos(2)>c_pos(2)
                                disp('Turning Right');
                                dir(robotid)=90;
                                %Send /R command
                            end
                        else
                            if n_pos(1)<c_pos(1)
                                disp('Moving front');
                                current_pos(robotid)=pos-1;
                                moveflag=1;
                                %Send /F command
                            elseif n_pos(1)>c_pos(1)
                                disp('Moving back');
                                current_pos(robotid)=pos+1;
                                moveflag=1;
                                %Send /B command
                            end
                            distance(robotid)=distance(robotid)+step_distance;
                        end

                    case 90
                        if eq(n_pos(1),c_pos(1))
                            if n_pos(2)<c_pos(2)
                                disp('Moving Back');
                                current_pos(robotid)=pos-10;
                                moveflag=1;
                                %Send /B command
                            elseif n_pos(2)>c_pos(2)
                                disp('Moving Front');
                                current_pos(robotid)=pos+10;
                                moveflag=1;
                                %Send /F command
                            end
                        else
                            if n_pos(1)<c_pos(1)
                                disp('Turning left');
                                %Send /L command 
                                dir(robotid)=0;
                            elseif n_pos(1)>c_pos(1)
                                disp('Turning right');
                                dir(robotid)=180;
                                %Send /R command
                            end
                            distance(robotid)=distance(robotid)+step_distance;
                        end

                    case 180
                         if eq(n_pos(1),c_pos(1))
                            if n_pos(2)>c_pos(2)
                                disp('Turning Left');
                                dir(robotid)=90;
                                %Send /L command 
                            elseif n_pos(2)<c_pos(2)
                                disp('Turning Right');
                                dir(robotid)=270;
                                %Send /R command
                            end
                         else
                            if n_pos(1)>c_pos(1)
                                disp('Moving front');
                                current_pos(robotid)=pos+1;
                                moveflag=1;
                                %Send /F command
                            elseif n_pos(1)<c_pos(1)
                                disp('Moving back');
                                current_pos(robotid)=pos-1;
                                moveflag=1;
                                %Send /B command
                            end
                            distance(robotid)=distance(robotid)+step_distance;
                         end

                    case 270
                         if eq(n_pos(1),c_pos(1))
                            if n_pos(2)>c_pos(2)
                                disp('Moving Back');
                                current_pos(robotid)=pos+10;
                                moveflag=1;
                                %Send /B command
                            elseif n_pos(2)<c_pos(2)
                                disp('Moving Front')
                                current_pos(robotid)=pos-10;
                                moveflag=1;
                                %Send /F command
                            end
                         else
                            if n_pos(1)>c_pos(1)
                                disp('Turning left');
                                dir(robotid)=180;
                                %Send /L command 
                            elseif n_pos(1)<c_pos(1)
                                disp('Turning right');
                                dir(robotid)=0;
                                %Send /R command
                            end
                            distance(robotid)=distance(robotid)+step_distance;
                         end
                end
                if not(moveflag)
                    pause(1);
                end
            end
            updaterobotpatch(i,c_pos,dir(robotid));
        end
    end
end