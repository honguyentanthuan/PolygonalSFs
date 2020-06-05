function w_value=value_T3_to_T6(w_value,ele_node,num)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
matrix=[1 2;2 3;3 1];

for i=1:num
    node=ele_node(i,:);
    for j=1:3
        w_value=[w_value;(w_value(node(matrix(j,1)),:)+w_value(node(matrix(j,2)),:))/2];
        %Delete same node
        w_value=delete_same_node(w_value);
        
    end
end