function update_env
%This function is supposed to be called everytime the robot moves from one
%position to the other.
%%Get the neccessary data
    global nf reachedflag envdata robotip robotid dir current_pos fire_pos patch_holder objdata stack
    s=webread(strcat(robotip{robotid},'/D'));
    obstacle_distance=40;
%%Check for obstacles
%fd->front distance
%ld->left distance
%rd->right distance
    switch dir(robotid)
        case 0
            if and(s.fd <= obstacle_distance,not(s.fd==0))
                objpos(1)=current_pos(robotid)-1;
            end
            if and(s.ld <= obstacle_distance,not(s.ld==0))
                objpos(2)=current_pos(robotid)-10;
            end
            if and(s.rd <= obstacle_distance,not(s.rd==0))
                objpos=current_pos(robotid)+10;
            end

        case 90
            if and(s.fd <= obstacle_distance,not(s.fd==0))
                objpos=current_pos(robotid)+10;
            end
            if and(s.ld <= obstacle_distance,not(s.ld==0))
                objpos=current_pos(robotid)-1;
            end
            if and(s.rd <= obstacle_distance,not(s.rd==0))
                objpos=current_pos(robotid)+1;
            end

        case 180
            if and(s.fd <= obstacle_distance,not(s.fd==0))
               objpos=current_pos(robotid)+1;
            end
            if and(s.ld <= obstacle_distance,not(s.ld==0))
                objpos=current_pos(robotid)+10;
            end
            if and(s.rd <= obstacle_distance,not(s.rd==0))
               objpos=current_pos(robotid)-10;
            end
        case 270
            if and(s.fd <= obstacle_distance,not(s.fd==0))
                objpos=current_pos(robotid)-10;
            end
            if and(s.ld <= obstacle_distance,not(s.ld==0))
                objpos=current_pos(robotid)+1;
            end
            if and(s.rd <= obstacle_distance,not(s.rd==0))
                objpos=current_pos(robotid)-1;
            end
    end
    %Correct code her when update_lucifermin is added.
    if envdata(objpos)
        return
    elseif any(find(current_pos==objpos))
        return
    elseif any(find(fire_pos==objpos))
        return
    else
        objdata(objpos)=1;
        [x,y]=getvertices(360,objpos);
        patch_holder{objpos}=patch(ax,x,y,'cyan');
        [tx,ty]=calculatepos(objpos);
        for i=1:nf
            id=fire_assignment(i);
            if any(ismember(stack{id},[tx ty],'rows'))            
                stack{id}=astarpath(i,current_pos(id));
                if stack{id}==inf
                    disp(strcat("Robot ",id," cannot reach fire number ",i));
                    nf=nf-1;
                    reachedflag(i)=1;
                    fire_pos(i)=[];
                end
            end
        end
    end
end