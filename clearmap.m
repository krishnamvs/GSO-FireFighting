function clearmap
global current_pos patch_holder envdata
temp=[current_pos';find(envdata)];
temp1=zeros(10,10);
temp1(temp)=1;
temp=[];
temp=find(not(temp1));
for i=1:length(temp)
    delete(patch_holder{temp(i)});
end
end