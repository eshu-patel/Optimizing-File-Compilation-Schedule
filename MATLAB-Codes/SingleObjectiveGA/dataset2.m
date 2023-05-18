function [c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset2()
%% Data Given
c = 10; % No. of compiled files
t = 7; % No. of target files
s = 2; % No. of servers

comp_times = [15,10,15,13,20,15,8,10,11,15]; %completion times
rep_times = [5,8,5,5,5,7,8,10,10,12]; %replication times
dependencies = ["","","1","2","2 3","1 2 3 4","2 3 4 5","1 3 4 5","3 5 6 7","3 4 5 7"]; %dependency graph

target_files = [4,5,6,7,8,9,10];
deadlines = [0,0,0,40,100,53,75,90,110,125]; %deadline times
goals = [0,0,0,8,15,35,30,40,45,50]; % goals

