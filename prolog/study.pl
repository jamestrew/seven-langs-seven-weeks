% last element in a list
saigo([A], A).
% saigo([H|[]], H). % len1
% saigo([_|[H2|[]]], H2). % len2

saigo([_|T], X) :- saigo(T, X).


% reversing a list
rev([], []).
% rev([A], List).
% rev([A], [A]).
% rev([Head|[]], [Head]). % [1] = [1]
% rev([Head|Tail], [Tail|Head]). % [1, 2] = [2, 1]
% rev([Head1|[Head2|Tail]], [Tail,Head2,Head1]). % [1,2,3] = [3,2,1]

rev([Head|Tail], List) :- rev(Tail, List2), append(List2, [Head], List).

% smallest
smallest([X], X).
smallest([X, Y|Rest], Min) :- X =< Y, smallest([X|Rest], Min).
smallest([X, Y|Rest], Min) :- X > Y, smallest([Y|Rest], Min).

% sorting
