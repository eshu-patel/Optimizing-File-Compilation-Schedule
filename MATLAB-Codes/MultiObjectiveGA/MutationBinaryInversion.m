function offspring  = MutationBinaryInversion(offspring,Pm)

[Np,D] = size(offspring); 

for i = 1:Np
    r = rand;
    if r < Pm         % Checking for mutation probability
        p1 = randi([1 D],1,1);             % Generate 1st spot
        p2 = randi([1 D],1,1);              % Generate 2nd spot
        while p2==p1
            p2 = randi([1 D],1,1);
        end

        temp = offspring(i,p2);
        offspring(i,p2) = offspring(i,p1);
        offspring(i,p1) = temp; 
    end
end