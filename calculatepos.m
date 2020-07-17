function [rowid,colid]=calculatepos(pos)
%Function calculate row & column number from position on the grid
    if eq(mod(pos,10),0)
        rowid=10;
        colid=pos/10;
    else
        rowid=mod(pos,10);
        colid=floor((pos+10)/10);
    end
end