function plot_mesh(Node,Element,op)
% =========================================================================
% Coded by : Thuan Ho-Nguyen-Tan
% Email    : honguyentanthuan@seoultech.ac.kr
% 
% Computational Solid Mechanics Laboratory,
% Department of Mechanical and Automotive Engineering,
% Seoul National University of Science and Technology (SeoulTech),Korea.
% =========================================================================

NElem=size(Element,1);
if isnumeric(Element)
    for iel=1:NElem
        Element1{iel}=Element(iel,:);
    end
    Element=Element1;
end

for i=1:length(Element)
    h2=trisurf(Element{i},...
        Node(:,1),...
        Node(:,2),...
        Node(:,3));
        hold on
    set(h2, 'FaceColor','interp','EdgeColor', 'none','LineStyle','-','linewidth',0.1);
    
end
view(2)
hold on
axis equal

if op==1
    % Plot node numbers
    for i=1:length(Node)
        h1=text(Node(i,1),Node(i,2),Node(i,3),num2str(i));
        set(h1,'fontsize',10,'color','r');hold on
    end
    % Plot element numbers
    for e=1:length(Element)
        xc = mean(Node(Element{e},:));
        h2=text(xc(1),xc(2), xc(3),sprintf('%d',e));
        set(h2,'fontsize',10,'color','b');hold on
    end
end
hold on
pause(0.2);
