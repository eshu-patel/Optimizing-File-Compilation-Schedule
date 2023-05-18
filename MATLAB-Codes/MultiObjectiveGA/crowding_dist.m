function [Pop,CrD] = crowding_dist(InitPop,k)
M = size(InitPop,2); % number of objectives
l = size(InitPop,1); % number of solution on the Fv front ( l = |I|, in the original paper)
crodDist = zeros(l,1);
for m = 1:M
    %fprintf('\n\nComputing the contribution to crodDist given by f_%d\n',m)
    [sorted_f_m, pos] = sort(InitPop(:,m));
    crodDist(pos(1)) = +Inf;
    crodDist(pos(end)) = +Inf;
    f_m_max = sorted_f_m(end);
    f_m_min = sorted_f_m(1);
    for i=2:l-1
        %tmp = plot(InitPop(pos(i),1), InitPop(pos(i),2), 'or', "markersize",6);
        old_crod_dist = crodDist(pos(i));
        delta = sorted_f_m(i+1)-sorted_f_m(i-1);
        if f_m_max ==  f_m_min
            normalizedDelta = 0;
        else
            normalizedDelta = delta/(f_m_max-f_m_min);
        end
        crodDist(pos(i)) = crodDist(pos(i)) + normalizedDelta;
        
        %fprintf('delta(%d) = %d - %d = %d,  normalizedDelta(%d) = %d/%d = %g\n', pos(i), sorted_f_m(i+1), sorted_f_m(i-1), delta, pos(i), delta, f_m_max-f_m_min, normalizedDelta );         
    end
    
end
%set(h,'visible','off')
%disp('Vector with the final croding distance, for all the solutions')
CrD = crodDist;
crodDist;
[sorted_crow_dist, pos] = sort(crodDist,'descend');
sorted_crow_dist;
%disp('The individuals that will be added are:')
%pos(1:k);
%disp('Their crowding distance is')
%disp(sorted_crow_dist(1:k));
InitPop(pos(1:k));
Pop = pos(1:k);
end