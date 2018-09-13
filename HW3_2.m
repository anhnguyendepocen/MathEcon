clear; 

syms Q;


TC = Q.^3 - 5*Q.^2 + 60*Q; % Total Cost
MC = diff(TC, Q);% Marginal Cost
AC =  Q^2-5*Q+60; % Average Cost

disp('Average Cost');
pretty(AC);

AC1 = diff(AC,Q);

disp('AC first derivative w.r.t. Q');
pretty(AC1);

AC2 = diff(AC1,Q);

% Second Order Derivative Test
disp('Second Order Derivative Test')
if (AC2 < 0)
        disp('Second Order Derivative Test value is constant and less than zero.')
        disp('Function is strictly concave and at a global maximum');
        disp('AC"  w.r.t. Q');
        pretty(AC2);
        %AC2 = 'double';

    elseif   (AC2 == 0)
        disp('Test is inconclusive');
        disp('AC" w.r.t. Q');
        pretty(AC2);
        %AC2 = 'double';
    elseif   (AC2 > 0)
        disp('Second Order Derivative Test value is constant and is greater than zero')
        disp('Function is strictly convex and at a global minimum');
        disp('AC" w.r.t. Q');
        pretty(AC2);
        %AC2 = 'double';
else 
        disp('further evaluation needed, continue taking high order derivatives or stop now and test is inconclusive')
        disp('AC" w.r.t. Q');
        pretty(AC2);
        

    %insert higher order derivative tests
    



end

% find AC min 
eqn1 = AC1 == 0;
ACmin = solve(eqn1);

subs(AC,Q,ACmin);
double(ans);
Qstar = ans;

disp('Q* ='); 
disp(ACmin);

disp('AC(Q*)');
disp(Qstar);


    fplot(AC,[0, 5], 'b'); % plot line
    
    hold on
    
    fplot(TC,[0, 5],'g');
    fplot(MC,[0, 5], 'black');


    % standard lines for each image
    legend('show','Location','best'); % add legend to graph

    % comment out to remove critical points
    plot(double(ACmin), double(subs(AC,ACmin)),'ro'); % plot critical points
    % plot(double(ACQstar), double(subs(AC,ACQstar)),'ro'); % plot critical points
    title('Optimization Graph');
hold off