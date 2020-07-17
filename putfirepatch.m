function putfirepatch
%Function that puts the patch for fire positions after the data is given
%by the user
    global ax nf fire_pos patch_holder;
    for i=1:nf
        if isempty(patch_holder{fire_pos(i)})
            [x,y]=getvertices(360,fire_pos(i));
            patch_holder{(fire_pos(i))}=patch(ax,x,y,'red');
        else
            p=patch_holder{fire_pos(i)};
            p.FaceColor='red';
            patch_holder{fire_pos(i)}=p;
        end
    end
end