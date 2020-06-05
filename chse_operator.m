function [nodes,elem,nod] = chse_operator(nod)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
%
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================

if nod>=3
    nodes = [cosd(2*180*((1:nod))/nod); sind(2*180*((1:nod))/nod)]';
    elem = 1:nod;
else
    error ('bad input!!')
end
