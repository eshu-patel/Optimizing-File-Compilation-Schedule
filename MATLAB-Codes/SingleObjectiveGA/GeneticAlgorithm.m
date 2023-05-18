function [bestsol,bestfitness,history] = GeneticAlgorithm(prob,Np,T,Pc,Pm,c,s,history,dataset)

f = NaN(Np,1);                      % Vector to store the fitness function value of the population members

OffspringObj = NaN(Np,1);           % Vector to store the fitness function value of the offspring members

D = c+s-1;                     % Determining the number of decision variables in the problem

% Generation of the initial population

Init_string = [1:c zeros(1,s-1)];
P = zeros(Np,D);

for i=1:Np
    rand_string = randperm(c+s-1);
    P(i,:) = Init_string(rand_string);
end

for p = 1:Np
    f(p) = prob(P(p,:));            % Evaluating the fitness function of the initial population
end

%% Iteration loop
for t = 1: T
    t
    %% Tournament selection 
    MatingPool = TournamentSelection(f,Np);          % Performing the tournaments to select the mating pool
    Parent = P(MatingPool,:);                        % Selecting parent solution 
    
    %% Crossover
    offspring  = CrossoverLOX(Parent,Pc);
    
    %% Mutation
    offspring  = MutationBinaryInversion(offspring,Pm);
    
    for j = 1:Np
        OffspringObj(j) = prob(offspring(j,:));     % Evaluating the fitness of the offspring solution
    end
        
    CombinedPopulation = [P; offspring];           
    [f,ind] = sort([f;OffspringObj]);               % mu + lambda selection
    
    f = f(1:Np);
    P = CombinedPopulation(ind(1:Np),:);    
    
    history(t) = f(1);
end

bestfitness = f(1);
bestsol = P(1,:);

