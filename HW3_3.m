clear; 

syms Q;

P = 12.5*exp(-.005*Q); % Price
TR =  (12.5*exp(-.005*Q))*Q; % Total Revenue

%disp('Total Revenue');
%pretty(TR);

TR1 = diff(TR,Q);
TR2 = diff(TR1,Q);

%disp('TR first derivative w.r.t. Q');
%pretty(TR1);


% start of solving the three equations 
eqn1 = TR1 == 0;
Qstar = solve(eqn1);


disp('Qstar ='); 
pretty(Qstar);


subs(TR,Q,Qstar);
double(ans);
TRmax = ans;

clear ans;

subs(TR2,Q,Qstar);
disp(ans);
double(ans);
TR2Qstar = ans;

clear ans; %clear ans for next use

disp('Total Revenue Max');
disp(TRmax);

    fplot(TR,[0, 4000], 'b'); % plot line
    hold on



    % standard lines for each image
    legend('show','Location','best'); % add legend to graph

    % comment out to remove critical points
    plot(double(Qstar), double(subs(TR,Qstar)),'ro'); % plot critical points
    title('Optimization Graph');
    hold off
