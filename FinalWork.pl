% Обьединение списков
customAppend([], List2, List2).

customAppend([Head | Body], List2, [Head | SerchTail]) :-
	customAppend(Body, List2, SerchTail).

% Заменить все X на NewX в списке
changeAllX(_, _, [], []).

changeAllX(X, NewX, [X | L], NewList) :-
    customAppend([NewX], L, Res),
    changeAllX(X, NewX, Res, NewList).

changeAllX(X, NewX, [Y | L], [Y | NewList]) :-  
    X \= Y, 
    changeAllX(X, NewX, L, NewList),
    !.

% Перестановка переменных
substList(Str, X, NewX, Res) :-
    changeAllX(X, NewX, Str, Res), 
    !.

% Заменить все X на NewX в строке
substitute(Str, X, NewX, Res) :-
    string_chars(Str, StrL),
    substList(StrL, X, NewX, ResList), 
    string_chars(Res, ResList).