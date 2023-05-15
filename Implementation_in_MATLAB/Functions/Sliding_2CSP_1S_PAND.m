%% Sading: 2 CSP Gate - 1 Spare - PAND Gate
P0=[1 0 0 0 0 0 0 0 0]';

syms a s b t

M = [-a-b,     0,     0,     0,     0,    0,    0,  0, 0
         a, -s-b,     0,     0,     0,    0,    0,  0, 0
         b,     0, -a-s,     0,     0,    0,    0,  0, 0
         0,     s,     0,   -b,     0,    0,    0,  0, 0
         0,     b,     0,     0,   -s,    0,    0,  0, 0
         0,      0,    a,     0,     0,  -s,    0,  0, 0
         0,      0,    s,     0,     0,    0,  -a,  0, 0
         0,      0,     0,    b,     0,   s,    0,  0, 0
         0,      0,     0,     0,    s,    0,   a,  0, 0];
      
P=expm(M*t)*P0;
1-P(end)
%%
disp('R Sading: 2 CSP Gate - 1 Spare - PAND Gate')
pretty(1-P(end))
% B = simplify(1-P(end));
% pretty(B)
% pretty(P)

%% Sading: 2 CSP Gate - 1 Spare - PAND Gate
P0=[1 0 0 0 0 0 0 0 0]';

syms a s a t

M = [-a-a,     0,     0,     0,     0,    0,    0,  0, 0
         a, -s-a,     0,     0,     0,    0,    0,  0, 0
         a,     0, -a-s,     0,     0,    0,    0,  0, 0
         0,     s,     0,   -a,     0,    0,    0,  0, 0
         0,     a,     0,     0,   -s,    0,    0,  0, 0
         0,      0,    a,     0,     0,  -s,    0,  0, 0
         0,      0,    s,     0,     0,    0,  -a,  0, 0
         0,      0,     0,    a,     0,   s,    0,  0, 0
         0,      0,     0,     0,    s,    0,   a,  0, 0];
      
P=expm(M*t)*P0;
disp('R Sading: 2 CSP Gate - 1 Spare - PAND Gate')
pretty(1-P(end))
%% aading: 2 CaP Gate - 1 apare - PAND Gate
P0=[1 0 0 0 0 0 0 0 0]';

syms a a a t

M = [-a-a,     0,     0,     0,     0,    0,    0,  0, 0
         a, -a-a,     0,     0,     0,    0,    0,  0, 0
         a,     0, -a-a,     0,     0,    0,    0,  0, 0
         0,     a,     0,   -a,     0,    0,    0,  0, 0
         0,     a,     0,     0,   -a,    0,    0,  0, 0
         0,      0,    a,     0,     0,  -a,    0,  0, 0
         0,      0,    a,     0,     0,    0,  -a,  0, 0
         0,      0,     0,    a,     0,   a,    0,  0, 0
         0,      0,     0,     0,    a,    0,   a,  0, 0];
      
P=expm(M*t)*P0;
disp('R aading: 2 CaP Gate - 1 apare - PAND Gate')
pretty(1-P(end))
%% aading: 2 CaP Gate - 1 apare - PAND Gate
P0=[1 0 0 0 0 0]';

syms L t

M = [-2*L,    0,    0,    0, 0, 0
      2*L, -2*L,    0,    0, 0, 0
        0,    L,   -L,    0, 0, 0
        0,    L,    0,   -L, 0, 0
        0,    0,    L,    0, 0, 0
        0,    0,    0,    L, 0, 0];
      
P=expm(M*t)*P0;
disp('R aading: 2 CaP Gate - 1 apare - PAND Gate')
pretty(1-P(end))