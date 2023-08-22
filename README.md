# File Compilation Optimization

An optimization project to explore meta-heuristic and mathematical methods to solve the problem of scheduling file compilation on multiple servers.

A project by Suvayan Nath ([@Rellik-7](https://github.com/Rellik-7)) and Eshu Patel([@eshu-patel](https://github.com/eshu-patel)). You can find our project report and slide deck here.

[Project Report](https://github.com/Rellik-7/OptimizeFileCompilation/blob/main/File-Compilation%20Report.pdf)

[Project Slides](https://github.com/Rellik-7/OptimizeFileCompilation/blob/main/File%20Compilation%20Slides.pdf) 

## Problem Statement
Imagine you have a bunch of files that need to be turned into usable software. Some files can only be worked on after their essential parts are ready and available. Once a file is ready, it takes a bit of time for everyone to access it. But there's a problem: sometimes files end up waiting for each other in a loop, preventing any progress and causing system issues. This is like a traffic jam. Also, because of the waiting times, servers might sit around doing nothing for too long, which can lead to missed deadlines.

## Metaheuristic Approach via Genetic Algorithm
We modify the standard genetic algorithm (GA) and create a specific set of variables or chromosome for our problem. Our adapted GA works well for permutation problems, and we detail a step-by-step procedure. Our approach combines goals of meeting file completion deadlines and minimizing tardiness into a single objective. With I files having attributes like deadlines, start times, compilation times, and goals.
We adjust the regular genetic algorithm (GA) and design a particular set of variables or chromosome tailored to our issue. Our customized GA is effective for permutation challenges, and we outline a step-by-step process. Our method unites the aims of meeting file completion deadlines and reducing lateness into a single objective. Among 'I' files with characteristics such as deadlines, start times, compilation durations, and goals, we establish the objective F using the provided pseudo-code.

## Mathematical Formulation
Besides the metaheuristic approach, we also create a mathematical formulation of the file compilation problem, inspired by mixed integer linear programming(MILP) formulation of the classical Job shop scheduling problem (JSSP). Our formulation applies for single objective mixed integer non-linear problem (MINLP). A detailed list of equations and their significance can be found in our report.

## Results
We apply both approaches mentioned above to multiple examples. In majority of the cases, our approaches converge to the optimal solution, validating our results.

![image](https://github.com/Rellik-7/OptimizeFileCompilation/assets/75270052/464c6c57-4f21-46f1-824c-be1dc53be135)

![image](https://github.com/Rellik-7/OptimizeFileCompilation/assets/75270052/96397cd4-ccf5-4108-82d1-3cf88ef553b5)

## Conclusion
Our example underscores the superiority of mathematical formulation over metaheuristic techniques like GA. Yet, both approaches carry their own strengths and weaknesses. Metaheuristic techniques allow us to tackle black box problems even without a mathematical model, whereas mathematical formulations hinge on such models being available. While mathematical formulations are resource-intensive, they offer guaranteed optimal solutions when appropriately constructed. In contrast, metaheuristic techniques lack such assurances, necessitating testing with various initial populations, which still might not yield the best solution.

Another notable drawback of our meta-heuristic approach is its sensitivity to random seeds and hyperparameters. The optimal solution is only attainable for specific seeds within a fixed number of iterations. Certain seeds might entirely fail to produce a viable solution.
