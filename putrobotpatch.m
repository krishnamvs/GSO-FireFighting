function putrobotpatch
%Function that puts the patch for robots once the user enters the data.
    global ax nr colors dir current_pos patch_holder;
    for i=1:nr
        [x,y]=getvertices(dir(i),current_pos(i));
        patch_holder{current_pos(i)}=patch(ax,x,y,colors{i});
    end
end