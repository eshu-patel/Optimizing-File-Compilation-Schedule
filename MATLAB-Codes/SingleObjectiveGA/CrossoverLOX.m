function offspring  = CrossoverLOX(Parent,Pc)

[Np,D] = size(Parent);                      % Detemining the no. of population and decision variables
indx = randperm(Np);                        % Permutating numbers from 1 to Np
Parent = Parent(indx,:);                    % Randomly shuffling parent solutions
offspring = NaN(Np,D);                      % Matrix to store offspring solutions

for i = 1:2:Np                              % Selecting parents in pairs for crossover
    
    r = rand;                               % Generating random number to decide if crossover is to be performed
    if r < Pc                               % Checking for crossover probability
        p1 = randi([1 D],1,1);             % Generate 1st crossover spot
        p2 = randi([1 D],1,1);              % Generate 2nd site different from 1st

        while p2==p1
            p2 = randi([1 D],1,1);
        end

        if p1>p2                            % Ensure p1 < p2
            [p1,p2] = deal(p2,p1);
        end
            
        idx_in_two = zeros(1,p2-p1+1);   %Find idx in 2nd parent, corresponding to those in 1st
        
        % First offspring 
        for j = p1:p2
            elem = Parent(i,j);
            if elem == 0
                th_zero = find((find(Parent(i,:)==0)) == j); % Find which 0 it is
                zeros_in_two = find(Parent(i+1,:)==0);       % Find indices of 0 in 2
                idx_in_two(j-p1+1) = zeros_in_two(th_zero(1)); %  Find index
            else
                idx_in_two(j-p1+1) = find(Parent(i+1,:)==elem);
            end
        end

        rem_in_two = setdiff(1:D, idx_in_two); %Non-hole indices

        left_half = rem_in_two(1:p1-1);  %Left of partition indices
        right_half = setdiff(rem_in_two,left_half); % Right of partition
        
        first_parent = Parent(i,:);
        sec_parent = Parent(i+1,:);
        offspring(i,:) = [sec_parent(left_half) first_parent(p1:p2) sec_parent(right_half)];

        % Second offspring
        for j = p1:p2
            elem = Parent(i+1,j);
            if elem == 0
                th_zero = find((find(Parent(i+1,:)==0)) == j); % Find which 0 it is
                zeros_in_two = find(Parent(i,:)==0);       % Find indices of 0 in 2
                idx_in_two(j-p1+1) = zeros_in_two(th_zero(1)); %  Find index
            else
                idx_in_two(j-p1+1) = find(Parent(i,:)==elem);
            end
        end

        rem_in_two = setdiff(1:D, idx_in_two); %Non-hole indices

        left_half = rem_in_two(1:p1-1);  %Left of partition indices
        right_half = setdiff(rem_in_two,left_half); % Right of partition
        
        first_parent = Parent(i+1,:);
        sec_parent = Parent(i,:);
        offspring(i+1,:) = [sec_parent(left_half) first_parent(p1:p2) sec_parent(right_half)];
    else
        offspring(i,:) =  Parent(i,:);               % Copying the first parent solution as first offspring in the absence of crossover
        offspring(i+1,:) =  Parent(i+1,:);           % Copying the second parent solution as offspring in the absence of crossover
    end
end
