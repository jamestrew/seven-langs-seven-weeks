concat([], List, List).
% concat([Head|[]], List, [Head|List]).
% concat([Head1|[Head2|[]]], List, [Head1, Head2|List]).
% concat([Head1|[Head2|[Head2|[]]]], List, [Head1, Head2, Head3|List]).

concat([Head|Tail1], List, [Head|Tail2]) :- concat(Tail1, List, Tail2).
