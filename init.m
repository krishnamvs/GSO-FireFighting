global fire_pos nf nr reachedflag
nf=input('Enter the Number of Fire Locations in the System :- ');
if nf>nr
    error('No:of Fire Locations is GREATER THAN NO:OF ROBOTS');
elseif nf<=0
    error('No:of Fire Locations is LESS THAN OR EQUAL TO 0');
else
    fire_pos=zeros(1,nf);
    reachedflag=zeros(1,nf);
    for i=1:nf
        is=num2str(i);
        fire_pos(i)=input(strcat('Enter the Location of Fire',is,' :- '));
    end
end
checkvalidityfirepos;
putfirepatch;