function [c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset1()
%% Data Given
c = 6; % No. of compiled files
t = 3; % No. of target files
s = 2; % No. of servers

comp_times = [15, 10, 15, 13, 20, 15]; %completion times
rep_times = [5, 18, 35, 52, 52, 21]; %replication times
dependencies = ["","","1","2","2 3","3 4"]; %dependency graph

target_files = [4, 5, 6];
deadlines = [0, 0, 0, 40, 100, 53]; %deadline times
goals = [0, 0, 0, 8, 15, 35]; % goals