# Firefly-algorithm

This project uses MATLAB to implement the firefly algorithm, which is a population-based optimization problem. Its validity is checked based on some test functions like Griewank, Ackely, Rosenbrock, Booth functions, etc.


A heuristic algorithm is one that is designed to solve a problem in a faster and more efficient fashion than traditional methods. Heuristic algorithms often times used to solve NP-complete problems, a class of decision problems.
A metaheuristic is a high-level problem-independent algorithmic framework that provides a set of guidelines or strategies to develop heuristic optimization algorithms
FA is a population-based optimization algorithm and mimics a firefly’s attraction to flashing light. This algorithm is naturally a multimodal algorithm. It is based on the swarming and light flashing behavior of tropical fireflies. In FA, a solution vector to an optimization problem is represented as the position of a firefly.
β0>0 is the attractiveness at zero distance, that is, rij=0. Though there is no best solution explicitly expressed in the equation, the fittest solution is selected from the population of n solutions at each iteration. In addition, γ is a scale-dependent parameter that controls the visibility of fireflies (absorption coeff), while α controls the strength of the randomization term. and εit is a vector of random numbers drawn from a Gaussian distribution or uniform distribution at time t.
The strong nonlinearity in FA can usually result in subdivision of the whole swarm into multiple subgroups or subswarms. Thus, FA is naturally suitable for multimodal optimization problems.

It can be shown that the limiting case gamma to 0 corresponds to the standard Particle Swarm Optimization (PSO).
