clc; 
clear; 
close all;

fprintf("FireFly Agorithm\n\n")

ch=1;

while(ch)
    fprintf("The choice of test functions are:\n")

    fprintf("0.Exit\n")
    fprintf("1.Ackley\n")
    fprintf("2.Booth\n")
    fprintf("3.Gold\n")
    fprintf("4.Griewank\n")
    fprintf("5.Rosenbrock\n")
    fprintf("6.Sphere\n")

    ch=input("\nEnter your choice:");

    switch ch
        case 1
            Func='Ackley';
        case 2
            Func='Booth';
        case 3
            Func='Gold';
        case 4
            Func='Griewank';
        case 5
            Func='Rosenbrock';
        case 6
            Func='Sphere'; 
        otherwise
            break
    end


    NumVars = 5; 
    Range = [-5,5]; 


    Pop = 25;
    MaxIter = 50;


    Gamma = 1; %absorption  
    Beta0 = 1;  %attraction
    Alpha = 0.2; %randomization
    m = 2;

    Damp = 0.99; 

    S_FireFly.Position = []; 
    S_FireFly.Cost = []; % optimization value

    FireFly = repmat(S_FireFly,Pop,1); 

    BestFireFly.Cost = inf; %bestvalue

    for i = 1 :Pop
        FireFly(i).Position = unifrnd(Range(1),Range(2),[1,NumVars]); 
        FireFly(i).Cost = feval(Func,FireFly(i).Position); 

        if FireFly(i).Cost<=BestFireFly.Cost
            BestFireFly = FireFly(i); 
        end   
    end


    BestFireFlyCost = zeros(MaxIter, 1);


    for Iter = 1 :MaxIter
    N_FireFly = FireFly;
        for i = 1 :Pop
            for j = 1 :Pop  

                if FireFly(j).Cost <= FireFly(i).Cost

                Distance = norm (FireFly(i).Position - FireFly(j).Position); 
                Beta = Beta0*exp(-Gamma*Distance^m); 

                Eps = unifrnd(-0.5*(Range(2)-Range(1)),0.5*(Range(2)-Range(1)),[1,NumVars]); 
                
                %xit+1=xit+β0(e^−γrij2)(xjt−xit)+αϵit

                N_FireFly(i).Position = FireFly(i).Position + Beta * (FireFly(j).Position - FireFly(i).Position)    + Alpha*Eps; 

                N_FireFly(i).Position = max(N_FireFly(i).Position,Range(1)); 
                N_FireFly(i).Position = min(N_FireFly(i).Position,Range(2));    

                N_FireFly(i).Cost = feval(Func,N_FireFly(i).Position); 

                if N_FireFly(i).Cost <= BestFireFly.Cost
                        BestFireFly = N_FireFly(i);
                end

                end
            end
        end

        FireFly = [N_FireFly
                   FireFly 
                   BestFireFly]; %#ok
        [~,SortOrder] = sort([FireFly.Cost]);
        FireFly = FireFly(SortOrder);
        FireFly = FireFly(1:Pop);

       
        Alpha = Alpha * Damp;
       
        BestFireFlyCost(Iter) = BestFireFly.Cost;
        
        disp(['Iteration:',num2str(Iter),' ||| Best Value=',num2str(BestFireFlyCost(Iter))]);

    end    

    figure;
    semilogy(BestFireFlyCost,'LineWidth',2);
    xlabel('Iteration');
    ylabel('Best Value');
    grid on;
end