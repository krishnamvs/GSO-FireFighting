function putmap
global ax envdata patch_holder objdata;
temp=find(envdata==1);
temp1=find(round(objdata)==1);
for i=1:length(temp)
    if isempty(patch_holder{temp(i)})
        [x,y]=getvertices(360,temp(i));
        patch_holder{temp(i)}=patch(ax,x,y,'black');
    end
end
for i=1:length(temp1)
    if isempty(patch_holder{temp(i)})
        [x,y]=getvertices(360,temp(i));
        patch_holder{temp(i)}=patch(ax,x,y,'cyan');
    end
end
end