function max_time = max_dependency_time(current_server_time,file_idx,dependency , finished_times,finished_server,comp_times,rep_times)
dependency = str2num(dependency);
if isempty(dependency) 
    max_time = 0;
else
    max_time = 0;
    for i = dependency
        if finished_server(finished_server(file_idx) == finished_server(i))  %Dependency was compiled on same server
            continue;                                       %We do not have to wait then
        else                                                %Dependency was on different server
            if current_server_time >= finished_times(i)+rep_times(i)  %is dependency already replicated
                continue;                                   %We do not wait then as well
            else                                            %File is not replicated yet

                % Here, we have 2 options. We know the current server
                % time, and when the dependency will be replicated.
                % To avoid idle server, we can choose to compile dependency
                % on the current server.
                time_without_recomp = finished_times(i)+rep_times(i);
                %time_with_recomp = current_server_time + comp_times(i);
                max_time = max(max_time,time_without_recomp);
            end
        end
    end
end

end