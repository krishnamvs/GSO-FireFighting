function checkvalidityfirepos
global nf fire_pos envdata;
for i=1:nf
    if envdata(fire_pos(i))
            t(1)=eq(envdata(fire_pos(i)-1),1);
            t(2)=eq(envdata(fire_pos(i)+1),1);
            t(3)=eq(envdata(fire_pos(i)-10),1);
            t(4)=eq(envdata(fire_pos(i)-10),1);
            if all(t)
                error('Location Surrounded by Objects. CANNOT REACH FIRE DESTINATION!!!.');
            end
    end
end