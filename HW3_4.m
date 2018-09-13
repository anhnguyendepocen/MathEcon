clear; 

syms x y lambda;


u = x^.5 * y^.5; % objective function
c =  200 - 2*x - 4*y; % constraint function



% setup Lagrange 

L = u+(lambda*c);
disp('Lagrange Function');
disp(L);

% Lagrange First order differentials
L1x = diff(L,x);
L1y = diff(L,y);
L1l = diff(L,lambda);

% Lagrange First order differentials
L2xx = diff(L1x, x);
L2yy = diff(L1y, y);
L2xy = diff(L1x, y);

disp('Lagrange First Order Conditions');
disp('first derivative wrt A');
disp(L1x);

disp('first derivative w.r.t C');
disp(L1y);

disp('first derivative w.r.t l');
disp(L1l);


disp('second derivative w.r.t xx');
disp(L2xx);

disp('second derivative w.r.t yy');
disp(L2yy);


disp('second derivative w.r.t xy');
disp(L2xy);


% start of solving the three equations 
eqn1 = L1x == 0;
eqn2 = L1y == 0;
eqn3 = L1l == 0;


disp('Lagrange first order conditions');
disp('first derivative w.r.t x = 0');
disp(eqn1);

disp('first derivative w.r.t y = 0');
disp(eqn2);

disp('first derivative w.r.t l = 0');
disp(eqn3);


sol = solve([eqn1, eqn2, eqn3], [x, y, lambda]);
xSol = sol.x;
ySol = sol.y;
lambdaSol = sol.lambda;

disp('x* ='); 
disp(xSol);
disp('y* =');
disp(ySol);
disp('lambda* =');
disp(lambdaSol);

disp('U(x*,y*)')
subs(u,x,xSol);
%subs(u,x,xSol)
usuby = ans;
clear ans;
subs(usuby,y,ySol);
disp(ans);
double(ans);
umax = ans;
disp('or');
disp(umax);
clear ans;
%image for problem

fsurf(u, [0 100]);


hold on
fsurf(c);

%text(X(0,50),Y(0,25),Z(50,25),'Peak');
%plot(double(xSol), double(subs(u,xSol)),'ro'); % plot critical points

hold off;
