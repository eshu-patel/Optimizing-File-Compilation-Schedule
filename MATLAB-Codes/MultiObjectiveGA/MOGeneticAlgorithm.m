function PP = MOGeneticAlgorithm(prob,Np,T,Pc,Pm,c,s)
f = NaN(Np,2);                      % Vector to store the fitness function value of the population members

OffspringObj = NaN(Np,2);           % Vector to store the fitness function value of the offspring members

D = c+s-1;                     % Determining the number of decision variables in the problem

% Generation of the initial population

Init_string = [1:c zeros(1,s-1)];
P = zeros(Np,D);

for i=1:Np
    rand_string = randperm(c+s-1);
    P(i,:) = Init_string(rand_string);
end
disp("Initial Pop");
P;

for p = 1:Np
    res = prob(P(p,:));
    f(p,1) = res(1);            % Evaluating the fitness function of the initial population
    f(p,2) = res(2);
end
disp("Init Values")
f;

%% Iteration loop
for t = 1: T
    t
    %% Tournament selection 
    MatingPool = TournamentSelection(f,Np);          % Performing the tournaments to select the mating pool
    MatingPool;
    Parent = P(MatingPool,:);                        % Selecting parent solution 
    Parent;
    %% Crossover
    offspring  = CrossoverLOX(Parent,Pc);
    %% Mutation
    offspring  = MutationBinaryInversion(offspring,Pm);
    offspring;

    for j = 1:Np
        % Evaluating the fitness of the offspring solution
        res = prob(offspring(j,:));
        OffspringObj(j,1) = res(1);            
        OffspringObj(j,2) = res(2);
    end
        
    CombinedPopulation = [P; offspring];
    CombinedObj = [f;OffspringObj];
    
    [~,pareto_ranks] = paretofronts(CombinedObj,[1 1],'pareto'); %Find pareto ranks
    unique_ranks = length(unique(pareto_ranks)); %Find number of pareto ranks
    cap_pop = Np; %How many we need to select
    PP = [];
    for j = 1:unique_ranks
        idxranks = find(pareto_ranks == j);
        if length(idxranks)<= cap_pop
            PP = [PP;CombinedPopulation(idxranks,:)];
            cap_pop = cap_pop - length(idxranks);
        else
            [choosePop,~] = crowding_dist(CombinedObj(idxranks,:),length(idxranks)-cap_pop);
            PP = [PP;CombinedPopulation(choosePop,:)];
            cap_pop = 0;
        end
        if cap_pop == 0
            break;
        end
    end
    PP;
end
