function [psi,dpsi_xi,dpsi_eta] = fem_shape(nodes,nod)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
%
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================

% --- gauss points and linear weight values
ite=2;
[Gauss_point,nodes_sub]=making_T3_mesh(nodes,ite);

% --- initialize
n = size(Gauss_point,1);
xyzGauss = zeros(n,2);
psi = zeros(n,nod);
dpsi_xi = zeros(n,nod);
dpsi_eta = zeros(n,nod);


for igauss=1:n
    xyzGauss(igauss,:)=Gauss_point(igauss,:);
    [psi(igauss,:),dpsi_xi(igauss,:),dpsi_eta(igauss,:)] = ...
        wachspress(1,xyzGauss(igauss,:),nod);
end

% --- plot shape functions
gcoord_sub=xyzGauss;
for i=1:nod
    figure()
    gcoord_sub(:,3)=psi(:,i);
    plot_mesh(gcoord_sub,nodes_sub,0);
end

% plot_plt(nodes,gcoord_sub,nodes_sub,psi,'wachspress',nod);
