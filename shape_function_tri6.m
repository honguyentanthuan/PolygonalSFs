function [N_6,Nxi,Neta]=shape_function_tri6(xi,eta)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
N_6=[1-3*(xi+eta)+4.*xi.*eta+2.*(xi.^2+eta.^2) ...
                        xi.*(2.*xi-1) ...
                        eta.*(2.*eta-1) ...
                        4*xi.*(1-xi-eta) ...
                        4*xi.*eta ...
                        4*eta.*(1-xi-eta)];
Nxi =[-3+4*(xi+eta),4*xi-1,zeros(size(xi)),4*(1-2*xi-eta),4*eta,-4*eta];                    

Neta =[-3+4*(xi+eta),zeros(size(xi)),4*eta-1,-4*xi,4*xi,4*(1-xi-2*eta)];

end