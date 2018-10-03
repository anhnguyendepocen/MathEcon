clear; 

syms Profit p t a b x;

profit = p*x - t*x - a*x - b*x^2;
profitD1 = diff(profit, x);


eqn1 = profitD1 == 0;
profitD1sol = solve(eqn1);


profitD2 = diff(profitD1,x);

eqn2 = profitD2 == 0;
profitD2sol= solve(eqn2);