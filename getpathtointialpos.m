function getpathtointialpos
global nf current_pos fire_assignment stack fire_pos initial_pos
for i=1:nf
    id=fire_assignment(i);
    initial_pos(id)
    fire_pos(i)=initial_pos(id);
    stack{id}=[];
    stack{id}=astarpath(i,current_pos(id));
    [x,y]=calculatepos(initial_pos(id));
    t=length(stack{id});
    stack{id}(t+1,:)=[x y];
end
end
    