function Gcoord=delete_same_node(Gcoord_total)
% =========================================================================
%                   delete the same nodes
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
%
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================
for i=1:length(Gcoord_total)
    for j=(i+1):length(Gcoord_total)
        if (Gcoord_total(i,:)==Gcoord_total(j,:))
            Gcoord_total(j,:)=1.224245532;
        end
    end
end
temp=[];
for i=1:length(Gcoord_total)
    if Gcoord_total(i,:)~=1.224245532
        temp=[temp;Gcoord_total(i,:)];
    end
end
Gcoord=temp;
end