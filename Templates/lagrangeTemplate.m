%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Author: Cliff Rodriguez
%  Date: September 2018
%  Institution: University of Colorado Denver


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% script is used to solve a Lagrange Optimization Problem in economics

syms A B Lambda; % declare variables

z = A^(1/2) + B^(1/2); % set objective funtion



c = 240 - 2*A - 3*B; % constraint function


L = z + Lambda*(c); % Set Lagrange Function



% set First order Derivatives of objective function

z1A = diff(z,A);
z1B = diff(z,B);

% set Second order Derivatives of objective function

z2AA = diff(z1A, A);
z2BB = diff(z1B, B);
z2AB = diff(z1A, B);

% First order Derivatives of Lagrange
L1A = diff(L,A);
L1B = diff(L,B);
L1Lambda = diff(L,Lambda);

% Second Order Derivatives (SOCs) for Lagrange

L2AA = diff(L1A,A);
L2BB = diff(L1B,B);
L2AB = diff(L1A,B);
L2BA = diff(L1B,A);

% check that Young's Theorem Holds

eq(L2AB,L2BA);
double(ans);
ytr = ans; %stores result of young's theorem test.

clear ans;



% First Order condition for Lagrange

L1CA = L1A == 0;
L1CB = L1B == 0;
L1CLambda = L1Lambda == 0;




% Second Order Conditions (SOCs) for Lagrange

L2CAA = L2AA == 0;
L2CBB = L2BB == 0;
L2CAB = L2AB == 0;

% Solve for optimized values and Lambda
sol = solve([L1CA, L1CB, L1CLambda],[A,B,Lambda]);
solA = sol.A;
solB = sol.B;
solLambda = sol.Lambda;



%get values of objective function using A*, B*
subs (z,A,solA);
holdans = ans;
subs(holdans,B,solB);
zOptimized = ans;
clear ans;

%get values of objective function at first order derivatives
subs (z1A,A,solA);
holdans = ans;
subs(hold,B,solB);
z1Astar = ans;
clear ans;

subs(z1B, B,solB);
hold = ans;
subs(hold, A,solA);
z1Bstar = ans;
clear ans;

%get values of objective function at second order derivatives
subs (z2AA,A,solA);
hold = ans;
subs(hold,B,solB);
z2AAstar = ans;
clear ans;

subs(z2BB, B,solB);
hold = ans;
subs(hold, A,solA);
z2BBstar = ans;
clear ans;

subs (z2AB,A,solA);
hold = ans;
subs(hold,B,solB);
z2ABstar = ans;
clear ans;


% Calculate Value for Second Order Condition Test
% evaluated at star values
% zAAstar*zBBstar-(zABstar)^2

t1Result = z2AAstar*z2BBstar-(z2ABstar)^2;
if t1Result == 0
    t1Resulttext = ("0");
elseif t1Result < 0
    t1Resulttext =("<0");   
elseif t1Result > 0
    t1Resulttext =(">0");
else
    t1Resulttext =("test does not compute correctly");
end     

% other second order derivative test
% evaluated at star values
%zAAstar*(zBstar)^2-2*zABstar*zAstar*zBstr+zBBstar*(zAstar)^2


t2Result = z2AAstar*(z1Bstar)^2-2*z2ABstar*z1Astar*z1Bstar+z2BBstar*(z1Astar)^2;
if t2Result == 0
    t2Resulttext = ("0");
elseif t2Result < 0
    t2Resulttext =("<0");   
elseif t2Result > 0
    t2Resulttext =(">0");
else
    t2Resulttext =("test does not compute correctly");
end    





diary on
diary Lagrangetemplate %update file name if desired
%graph results and save image
fsurf(@(x,y) 80.*x - 2.*x^2 - x.*y - 3.*y^2 + 100.*y,[0 12])
hold on
fsurf(c);

hold off




% Set things to display in the console:
disp('  Author: Cliff Rodriguez'); % enter name of author
disp('  Date: September 2017'); % enter date
disp('  Institution: University of Colorado - Denver; Economics Department'); % enter name of information



% Display results comment out lines when not needed

disp('Objective function:');
disp(z);


disp('Constraint function:');
disp(c);

disp('Lagrange function:');
disp(L);


disp('Lagrange Function First Order Conditions');
disp('');
disp(L1CA);

disp('');
disp(L1CB);

disp('');
disp(L1CLambda);

disp('A* = ');
disp(solA);

disp('B* = ');
disp(solB);

disp('Lambda*');
disp(solLambda);

disp('Optimized Output/Utility');
disp(zOptimized);


% Lambda interpretations

disp('If the constraint were relaxed by 1 then expected utility is expected to change in the same direction as the relaxation by: ');
disp(solLambda);


% Check Young's Theorem
if ytr == 0
    disp('Youngs Theorem does NOT hold!  Proceed with caution!');
else
    disp('note: Youngs Theorem holds');
end 



diary off