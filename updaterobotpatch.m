function updaterobotpatch(i,c_pos,d)
%Function that updates the patch of the robot after it moves.
%% Get neccessary data
    global ax colors patch_holder robotid current_pos reachedflag dir
%%
    pre_pos=c_pos(1)+((c_pos(2)-1)*10);
    if eq(reachedflag(i),1)
        [x1,y1]=getvertices(dir(robotid),current_pos(robotid));
        p=patch_holder{current_pos(robotid)};
        p.Vertices=[x1' y1'];
        patch_holder{current_pos(robotid)}=p;
    else
        [x1,y1]=getvertices(d,current_pos(robotid));
        [x2,y2]=getvertices(360,pre_pos);
        p=patch_holder{pre_pos};
        p.Vertices=[x1' y1'];
        patch_holder{current_pos(robotid)}=p;
        patch_holder{pre_pos}=patch(ax,x2,y2,colors{robotid});
    end
end
