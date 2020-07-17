function update_lucifermin
    global objdata decay
    t=find(objdata>=decay);
    objdata(t)=objdata(t)-decay;
end