function [c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset3()
%% Data Given
c = 20; % No. of compiled files
t = 20; % No. of target files
s = 3; % No. of servers

comp_times = [5,10,15,12,15,17,11,7,10,12,14,10,16,13,18,9,11,10,15,18]; %completion times
rep_times = [5,4,9,8,6,3,4,5,7,5,6,8,5,4,6,4,6,5,8,9]; %replication times
dependencies = ["","","1","2","","3 4","5","3 7","3 5","8 9","4 5 8","6 8 9","9 7 11","8 10 12","6 8 11","9 13 14 15","8 12 14 15","6 13 14 15","1 12 15 16 17","8 10 14 15 16"]; %dependency graph

target_files = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
deadlines = [20,20,40,45,50,60,40,80,60,80,80,85,90,100,100,120,120,130,125,130]; %deadline times
goals = [10,15,12,16,8,6,20,22,11,15,5,6,7,15,20,12,11,10,21,25]; % goals

