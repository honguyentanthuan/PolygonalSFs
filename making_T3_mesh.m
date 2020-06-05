function [gcoord,ele_node]=making_T3_mesh(gcoord_ini,ite)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
num=size(gcoord_ini,1);
gcoord=gcoord_ini;

% Find coordinate of midle point
%--------------------------------------------------------------------------
gcoord=[gcoord;sum(gcoord_ini,1)/num];
% Element conectvity
%--------------------------------------------------------------------------
m=(num+1)*ones(num,1);
n=[];
for i=1:num
    if i<num
        n=[n;i i+1];
    else
        n=[n;i 1];
    end
end
ele_node_ini=[n m];

% Weight value at the main nodes
w_value=eye(num,num);

% Weight value at the middle node
w_value=[w_value;sum(w_value,1)/num];

% Find weight values using linear approximation
%--------------------------------------------------------------------------
%
for i=1:ite
    % Find new nodes from T3 to T6
    if i==1
        num_T3=size(ele_node_ini,1);
        % Coord value at the mid-node of each edge
        [gcoord,ele_node_T6]=T3_to_T6(gcoord,ele_node_ini,num_T3);
        % Weight value at the mid-node of each edge
        w_value=value_T3_to_T6(w_value,ele_node_ini,num_T3);
    else
        num_T3=size(ele_node,1);
        [gcoord,ele_node_T6]=T3_to_T6(gcoord,ele_node,num_T3);
        w_value=value_T3_to_T6(w_value,ele_node_T6,num_T3);
    end
    % Create new element from T6 to T3
    ele_node=T6_to_T3(ele_node_T6);
end

