function checkfirestatus
%Fill the correct path
global nf robotip fire_assignment threshold reachedflag
for i=1:nf
    id=fire_assignment(i);
    s.ff=webread(strcat(robotip{id},'/W'));
    if s.ff <= threshold(id)
        continue;
    else 
        reachedflag(i)=0;
    end
end