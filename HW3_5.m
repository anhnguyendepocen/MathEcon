clear; 

syms k l lambda;


q = k^.3 * l^.5; % objective function
c =  384 - 6*k - 2*l; % constraint function

fsurf(@(k,l) k^.3 * l^.5,[0 75])
hold on
fsurf(c);

hold off

% setup Lagrange 
disp('objective function');
disp(q);

Q = q+(lambda*c);
disp('Lagrange Function');
disp('Q = ');
disp(Q);

Q1k = diff(Q,k);


Q1l = diff(Q,l);

Q1lambda = diff(Q,lambda);

Q2kk = diff(Q1k, k);
Q2ll = diff(Q1l, l);
Q2kl = diff(Q1k, l);

disp('first derivative of Q w.r.t K');
pretty(Q1k);

disp('first derivative Q w.r.t L');
pretty(Q1l);

disp('first derivative Q w.r.t lambda');
pretty(Q1lambda);


disp('second derivative Q w.r.t kk');
pretty(Q2kk);

disp('second derivative Q w.r.t ll');
pretty(Q2ll);


disp('second derivative Q w.r.t kl');
pretty(Q2kl);


% start of solving the three equations 
eqn1 = Q1k == 0;
eqn2 = Q1l == 0;
eqn3 = Q1lambda == 0;
sol = solve([eqn1, eqn2, eqn3], [k, l, lambda]);
kSol = sol.k;
lSol = sol.l;
lambdaSol = sol.lambda;

disp('k* ='); 
disp(kSol);
disp('l* =');
disp(lSol);




disp('lambda* =');
double(lambdaSol);
lambdaSol = ans;
clear ans;
disp(lambdaSol);



disp('max output assuming second order conditions are met is:');
disp('q(k*,l*) = ');
subs(q,l,lSol);
maxOutput = ans;
subs(maxOutput,k,kSol);
double(ans);
disp(ans)
maxOutput = ans;
clear ans;
