clc                                 % To clear the command window
clear                               % To clear the workspace

%% Problem settings
prob = @CostFunction;                  % Fitness function


%% Parameters for Genetic Algorithm
Np = 200;                            % Population Size
T = 500;                            % No. of iterations
Pc = 0.15;                          % Crossover probability
Pm = 0.5;                          % Mutation probability

[c,t,s,comp_times,rep_times,dependencies,target_files,deadlines,goals] = dataset1();
rng(16,'twister');
P = MOGeneticAlgorithm(prob,Np,T,Pc,Pm,c,s)
sols = [];
for i=1:size(P,1)
    sols = [sols;CostFunction(P(i,:))];
end
sols
filter_sols = [];
for i=1:Np
    if sols(i,1) ~= 10000 && sols(i,2) ~= 10000
        filter_sols = [filter_sols;sols(i,:)];
    end
end
paretofronts(filter_sols,[1 1],'pareto',2);
ylabel("Speed Points");
xlabel("Compile Points");