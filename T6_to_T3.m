function ele_node=T6_to_T3(ele_node)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
%
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
a=size(ele_node,1);
ele_node_ii=[];
for i=1:a
    node(i,:)=ele_node(i,:);
    ele_node_i=[node(i,1) node(i,4) node(i,6)
        node(i,4) node(i,2) node(i,5)
        node(i,4) node(i,5) node(i,6)
        node(i,6) node(i,5) node(i,3)];
    ele_node_ii=[ele_node_ii;ele_node_i];
    ele_node_i=[];
end
ele_node=ele_node_ii;
end