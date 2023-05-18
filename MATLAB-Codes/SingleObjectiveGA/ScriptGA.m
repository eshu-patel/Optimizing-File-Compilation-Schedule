clc                                 % To clear the command window
clear                               % To clear the workspace

%% Problem settings
prob = @CostFunction;                  % Fitness function


%% Parameters for Genetic Algorithm
Np = 30;                            % Population Size (20 for dataset1, 30 for dataset2)
T = 50;                            % No. of iterations
Pc = 0.1;                          % Crossover probability (0.15 for data1, 0.1 for data2)
Pm = 0.8;                          % Mutation probability  (0.5 for data1, 0.8 for data2)

[c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset2();

rng(101,'twister'); % 16 for data1, 86 for data2
history = zeros(1,T);
[bestsol,bestfitness,history] = GeneticAlgorithm(prob,Np,T,Pc,Pm,c,s,history);

bestsol
bestfitness

plot(1:T,history);
title("BestFitness vs. Iterations");
ylabel("Best Fitness");
xlabel("Iterations");