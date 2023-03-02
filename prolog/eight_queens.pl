valid_queen([Row, Col]) :-
  Range = [1, 2, 3, 4, 5, 6, 7, 8],
  member(Row, Range),
  member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :-
  valid_queen(Head),
  valid_board(Tail).

rows([], []).
rows([[Row, _]|QueensTail], [Row|RowsTail]) :-
  rows(QueensTail, RowsTail).

cols([], []).
cols([[_, Col]|QueensTail], [Col|ColsTail]) :-
  cols(QueensTail, ColsTail).

diag1([], []).
diag1([[Row, Col]|QueensTail], [Diag|DiagsTail]) :-
  Diag is Col - Row,
  diag1(QueensTail, DiagsTail).

diag2([], []).
diag2([[Row, Col]|QueensTail], [Diag|DiagsTail]) :-
  Diag is Col + Row,
  diag2(QueensTail, DiagsTail).

eight_queens(Queens) :-
  length(Queens, 8),
  valid_board(Queens),

  rows(Queens, Rows),
  cols(Queens, Cols),
  diag1(Queens, Diags1),
  diag2(Queens, Diags2),

  fd_all_different(Rows),
  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).


%% %%%%%%%%%%%%%%%%55555

valid_queen_opt((_, Col)) :- member(Col, [1, 2, 3, 4, 5, 6, 7, 8]).

valid_board_opt([]).
valid_board_opt([Head|Tail]) :- valid_queen_opt(Head), valid_queen_opt(Tail).

cols_opt([], []).
cols_opt([(_, Col)|QueensTail], [Col|ColsTail]) :- cols_opt(QueensTail, ColsTail).

diag1_opt([], []).
diag1_opt([(Row, Col)|QueensTail], [Diag|DiagsTail]) :-
  Diag is Col - Row,
  diag1_opt(QueensTail, DiagsTail).

diag2_opt([], []).
diag2_opt([(Row, Col)|QueensTail], [Diag|DiagsTail]) :-
  Diag is Col + Row,
  diag2_opt(QueensTail, DiagsTail).

eight_queens_opt(Board) :-
  Board = [(1,_), (2,_), (3,_), (4,_), (5,_), (6,_), (7,_), (8,_)],
  valid_board_opt(Board),
  cols_opt(Board, Cols),
  diag1_opt(Board, Diags1),
  diag2_opt(Board, Diags2),
  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).

