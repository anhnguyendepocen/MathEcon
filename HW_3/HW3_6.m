clear; 

syms x y lambda;


p = 80*x - 2*x^2 - x * y - 3*y^2 + 100*y; % objective function
c =  12 - x - y; % constraint function

fsurf(@(x,y) 80.*x - 2.*x^2 - x.*y - 3.*y^2 + 100.*y,[0 12])
hold on
fsurf(c);

hold off

% setup Lagrange 

P = p+(lambda*c);
disp('Profit equals');
disp(P);

P1x = diff(P,x);


P1y = diff(P,y);

P1l = diff(P,lambda);

P2xx = diff(P1x, x);
P2yy = diff(P1y, y);
P2xy = diff(P1x, y);

disp('first derivative -> x');
pretty(P1x);

disp('first derivative -> y');
pretty(P1y);

disp('first derivative -> l');
pretty(P1l);


disp('second derivative -> xx');
pretty(P2xx);

disp('second derivative -> yy');
pretty(P2yy);


disp('second derivative -> xy');
pretty(P2xy);


% start of solving the three equations 
eqn1 = P1x == 0;
eqn2 = P1y == 0;
eqn3 = P1l == 0;
sol = solve([eqn1, eqn2, eqn3], [x, y, lambda]);
xSol = sol.x;
ySol = sol.y;
lambdaSol = sol.lambda;

disp('x ='); 
disp(xSol);
disp('y =');
disp(ySol);
disp('lambda =');
disp(lambdaSol);
