clear; 

syms K L lambda;


q = 100*(.2*K^.5 + .8*L^.5)^2; % objective function
c =  4100 - 10*K - 4*L; % constraint function

% fsurf(@(K,L) 100*(.2*x^.5 + .8*y^.5)^2,[0 410])

% setup Lagrange 

Q = q+(lambda*c);
disp('objective function Q =');
disp(Q);

Q1k = diff(Q,K);


Q1l = diff(Q,L);

Q1lambda = diff(Q,lambda);

Q2kk = diff(Q1k, K);
Q2ll = diff(Q1l, L);
Q2kl = diff(Q1k, L);

disp('first order derivative of Q w.r.t K');
disp(Q1k);

disp('first order derivative of Q w.r.t L');
disp(Q1l);

disp('first order derivative of Q w.r.t lambda');
disp(Q1lambda);


disp('second order derivative of Q w.r.t kk');
disp(Q2kk);

disp('second order derivative of Q w.r.t ll');
disp(Q2ll);


disp('second order derivative of Q w.r.t kl');
disp(Q2kl);


% start of solving the three equations 
eqn1 = Q1k == 0;
eqn2 = Q1l == 0;
eqn3 = Q1lambda == 0;
sol = solve([eqn1, eqn2, eqn3], [K, L, lambda]);
kSol = sol.K;
lSol = sol.L;
lambdaSol = sol.lambda;

disp('K* ='); 
disp(kSol);
disp('L* =');
disp(lSol);
disp('lambda* =');
disp(lambdaSol);


disp('max output assuming second order conditions are met is:');
disp('q(k*,l*) = ');
subs(q,L,lSol);
maxOutput = ans;
subs(maxOutput,K,kSol);
double(ans);
disp(ans)
maxOutput = ans;
clear ans;


% using k*, l* labmbda start perform second order derivative test


% set values for FxxFyy-[Fxy]^2

T1 = Q2kk*Q2ll-Q2kl^2;
subs(T1,K,kSol);
disp(ans);
T1_K = ans;
subs (T1_K,L,lSol);
double(ans);
T1_Result = ans;

disp('Second Order Test (Test 1) Result')
disp(T1_Result)


% Fxx(Fy)^2 - 2(FxyFxFy)+Fyy(Fx)^2
T2 = Q2kk*(Q1k)^2 - 2*(Q2kl*Q1k*Q1l)+Q2ll*(Q1k)^2;
subs(T2,K,kSol);
T2_K = ans;

subs (T2_K,L,lSol);
T2_L = ans;

subs (T2_L,lambda,lambdaSol);
double(ans);
disp('Second Order Test (Test 2) Result')
disp(ans);
T2_Result = ans;

if T2_Result < 0


