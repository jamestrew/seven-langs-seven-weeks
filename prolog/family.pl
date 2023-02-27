father(abe, homer).
father(homer, bart).

ancestor(X, Y) :- father(X, Y) ; .
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).

% the above is equivalent to `ancestor(X, Y) :- father(X, Y) ; father(X, Z), ancestor(Z, Y).`
