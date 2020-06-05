function [psi,dpsi_xi,dpsi_eta] = wachspress(n,pospg,nn)
%==========================================================================
%     determine the values of the Whachspress SF on the Gauss points
%                         for rectangle element
%==========================================================================
% Coded by: Thuan Ho-Nguyen-Tan
% Email: honguyentanthuan@gmail.com
%
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech), Korea.
% Last modified: 7 July 2016
%--------------------------------------------------------------------------
% --- initialize
psi = zeros(n,nn);
dpsi_xi = zeros(n,nn);
dpsi_eta = zeros(n,nn);
ex=1e-10; % to ensure nonzero value of area

% --- Whachspress shape functions
p = [cosd(2*180*((1:nn))/nn); sind(2*180*((1:nn))/nn)]';
% p = [0 0;1 0;1 1/2; 1/2 1;0 1];
p = [p; pospg];
Tri = zeros(nn,3); Tri(1:nn,1)=nn+1;
Tri(2:nn,2)=1:nn-1; Tri(2:nn,3)=2:nn; Tri(1,3)=1;Tri(1,2)=nn;

Tri1 = zeros(nn,3); Tri1(1:nn,2)=1:nn;
Tri1(2:nn,1)=1:nn-1; Tri1(1,1)=nn; Tri1(1:nn-1,3)=2:nn;Tri1(nn,3)=1;

%------------------------------------------------ POLYGONAL SHAPE FUNCTIONS
alpha=zeros(nn,1);  dalpha=zeros(nn,2);
sum_alpha=0.0; sum_dalpha=zeros(1,2); A=zeros(nn,1); dA=zeros(nn,2);
A1=zeros(nn,1);

for i=1:nn
    sctr = Tri(i,:);sctr1 = Tri1(i,:);
    pT = p(sctr,:);pT1 = p(sctr1,:);
    
    A(i) = 1/2*det([pT,ones(3,1)])+ex;
    A1(i) = 1/2*det([pT1,ones(3,1)])+ex;
    
    dA(i,1) = 1/2*(pT(3,2)-pT(2,2))+ex;
    dA(i,2) = 1/2*(pT(2,1)-pT(3,1))+ex;
end

A=[A;A(1,:)];
dA=[dA;dA(1,:)];

for i=1:nn
    alpha(i) = A1(i)/(A(i)*A(i+1));
    dalpha(i,1) = -alpha(i)*(dA(i,1)/A(i)+dA(i+1,1)/A(i+1));
    dalpha(i,2) = -alpha(i)*(dA(i,2)/A(i)+dA(i+1,2)/A(i+1));
    sum_alpha = sum_alpha + alpha(i);
    sum_dalpha(1:2) = sum_dalpha(1:2)+dalpha(i,1:2);
end

for i=1:nn
    % --- shape function
    psi(1,i) = alpha(i)/sum_alpha;
    % --- derivatures of shape function w.r.t xi
    dpsi_xi(1,i) = (dalpha(i,1)-psi(1,i)*sum_dalpha(1))/sum_alpha;
    % --- derivatures of shape function w.r.t eta
    dpsi_eta(1,i) = (dalpha(i,2)-psi(1,i)*sum_dalpha(2))/sum_alpha;
end



