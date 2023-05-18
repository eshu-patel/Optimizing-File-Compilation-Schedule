function F = CostFunction(x)
[c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset2();
ptrs = [1,find(x==0,s)+1]; % Find index of every server ( 1 and other positions after 0)
time = zeros(1,s); % Time of every server
finished_files = []; % Array of compiled files
finished_server = zeros(1,c); % Server which compiled the file (First)
finished_times = zeros(1,c)-1; % Array of compiled times per file
speed_pts = 0;
compile_points = 0;
F = 0;
while 1
    comp_count = 0; % No of files compiled in this timestep
    for i = 1:s
        if (ptrs(i) == s+c || x(ptrs(i)) == 0)    % If a server has compiled all of its files we need not go ahead
            continue
        end
        if compilable_check(finished_files,dependencies(x(ptrs(i))))
            comp_count = comp_count+1;
            finished_files = [finished_files x(ptrs(i))];
            finished_server(x(ptrs(i))) = i;
            % Find time of completion
            
            max_dep_time = max_dependency_time(time(i),x(ptrs(i)),dependencies(x(ptrs(i))),finished_times,finished_server,comp_times,rep_times);
            finished_times(x(ptrs(i))) = max(max_dep_time,time(i)) + comp_times(x(ptrs(i)));
            time(i) = finished_times(x(ptrs(i)));
            
            % Scoring
            if ismember(x(ptrs(i)),target_files) && finished_times(x(ptrs(i)))<=deadlines(x(ptrs(i)))
                compile_points = compile_points - goals(x(ptrs(i)));
                speed_pts = speed_pts - (deadlines(x(ptrs(i)))-finished_times(x(ptrs(i))));
            end

            %Update ptrs
            ptrs(i) = ptrs(i)+1;
        end
        comp_count;
    end
    
    if length(finished_files) == c
        F = compile_points + speed_pts;
        break;
    elseif comp_count == 0
        F = 1e4;
        break;
    end
end
ptrs;
finished_files;
finished_times;
finished_server;
end
