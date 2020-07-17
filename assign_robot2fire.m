function assign_robot2fire
%Have to correct the functon for special cases
     global nf nr fire_pos current_pos fire_assignment stack reachedflag
     path_matrix=cell(nf,nr);
     selection_matrix=NaN(nf,nr);
    for i=1:nf
        for j=1:nr
            path_matrix{i,j}=astarpath(i,current_pos(j));
            if path_matrix{i,j}==inf
                selection_matrix(i,j)=NaN;
                path_matrix{i,j}=NaN; 
            else
            selection_matrix(i,j)=size(path_matrix{i,j},1);
            end
        end
    end
    for i=1:nf
        if any(ismember(selection_matrix(i,:),[NaN NaN NaN],'rows'))
            disp(strcat('Cannot reach fire number',i));
            nf=nf-1;
            reachedflag(i)=1;
            fire_pos(i)=[];
            path_matrix{i,:}=[];
            selection_matrix{i,:}=[];
        end
    end
    for i=1:nf
        minpath=min(selection_matrix,[],2,'omitnan');
        [x,y]=find(selection_matrix==min(minpath));
        selection_matrix(x(1),:)=NaN(1,nr);
        selection_matrix(:,y(1))=NaN(nf,1);
        fire_assignment(x(1))=y(1);
        stack{y(1)}=path_matrix{x(1),y(1)};
    end
end