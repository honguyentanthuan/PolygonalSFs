function [gcoord,ele_node]=T3_to_T6(gcoord,ele_node,num)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
matrix=[1 2;2 3;3 1];
ele_i=[];
ele_ii=[];
for i=1:num
    node=ele_node(i,:);
    for j=1:3
        gcoord=[gcoord;(gcoord(node(matrix(j,1)),1)+gcoord(node(matrix(j,2)),1))/2 ...
            (gcoord(node(matrix(j,1)),2)+gcoord(node(matrix(j,2)),2))/2];
        mm=0;
        for k=1:(length(gcoord)-1)
            if gcoord(k,:)==gcoord(length(gcoord),:)
                mm=k;
            end
        end
        gcoord=delete_same_node(gcoord);
        if mm==0
            ele_i=[ele_i length(gcoord)];
        else
            ele_i=[ele_i mm] ;
        end
        
    end
    ele_ii=[ele_ii;ele_i];
    ele_i=[];
end
ele_node=[ele_node ele_ii];

end