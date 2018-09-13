subs(Q2kk,K,kSol);
Q2kk_star = ans;
subs(Q2kk,L,lSol);
Q2kk_star = ans;
clear ans;

subs(Q2ll,L,lSol);
Q2ll_star = ans;
subs(Q2ll,K,kSol);
Q2ll_star = ans;
clear ans;

subs(Q2kl,K,kSol);
Q2kl_star = ans;
subs(Q2kl,L,lSol);
Q2kl_star = ans;
clear ans;

%make calculation for FxxFyy-[Fxy]^2

SOCT1 = (Q2kk_star)*(Q2ll_star)-(Q2kl_star^2);

disp('Result of SOC Test 1 FxxFyy-[Fxy]^2')
disp(SOCT1);