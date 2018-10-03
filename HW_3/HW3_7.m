clear; 

syms C A lambda;


p = 2*C^.5 + A^.5; % objective function
c =  150 - .5*A - C; % constraint function

fsurf(@(C,A) 2*C^.5 + A^.5,[0 150])

% setup Lagrange 

P = p+(lambda*c);
disp('Profit equals');
disp(P);

P1A = diff(P,A);


P1C = diff(P,C);

P1l = diff(P,lambda);

P2AA = diff(P1A, A);
P2CC = diff(P1C, C);
P2AC = diff(P1A, C);

disp('first derivative -> A');
disp(P1A);

disp('first derivative -> C');
disp(P1C);

disp('first derivative -> l');
disp(P1l);


disp('second derivative -> xx');
disp(P2AA);

disp('second derivative -> yy');
disp(P2CC);


disp('second derivative -> xy');
disp(P2AC);


% start of solving the three equations 
eqn1 = P1A == 0;
eqn2 = P1C == 0;
eqn3 = P1l == 0;
sol = solve([eqn1, eqn2, eqn3], [A, C, lambda]);
ASol = sol.A;
CSol = sol.C;
lambdaSol = sol.lambda;

disp('A ='); 
disp(ASol);
disp('C =');
disp(CSol);
disp('lambda =');
disp(lambdaSol);
