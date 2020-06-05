% =========================================================================
% 
%                        FEM SHAPE FUNCTIONS
% 
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
% Date: 2017.July.18 
% -------------------------------------------------------------------------

clc
clear all
close all

% --- input number of tops n>=3
n = 5;

% --- choosing operation
[nodes,elem,nod] = chse_operator(n);

% --- construct shape functions and their derivatives
[psi,dpsi_xi,dpsi_eta] = fem_shape(nodes,nod);
