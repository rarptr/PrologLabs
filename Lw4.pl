/*
Лабораторная работа N 4 “Списки”
Цель работы: 
	Написать программу на языке Prolog.
Задания к работе:
*/

% Вспомогательные утверждения (предикаты)

% 2, 4, 6, 8, .., N
evenList(N, List) :- 
    N >= 2,
    (mod(N, 2) =:= 0 ->  
    	EvenN is N;
    	EvenN is N - 1),
    evenStep(EvenN, TempList),   
    customAppend(TempList, [EvenN], List).

evenStep(2, []) :- !.

evenStep(N, List) :-     
    NewN is N - 2, 
    evenStep(NewN, TempList),  
	customAppend(TempList, [NewN], List).

% 1, 3, 5, 7, 9, .., N
oddList(N, List) :- 
    N >= 1,
    (mod(N, 2) =:= 0 ->  
    	OddN is N - 1;
    	OddN is N),
    oddStep(OddN, TempList),
	customAppend(TempList, [OddN], List).

oddStep(1, []) :- !.

oddStep(N, List) :-     
    NewN is N - 2,
    oddStep(NewN, TempList),  
	customAppend(TempList, [NewN], List).	

% Сумма элементов списка
listSum([], 0).

listSum([H | T], Sum):- 
    listSum(T, S1),
    Sum is S1 + H.

% Произведение элементов списка
listMult([], 1).

listMult([H | T], Mult):- 
    listMult(T, S1),
    Mult is S1 * H.

% Удаление всех X из списка
delAllX(_, [], []).

delAllX(X, [X | L], NewList) :-
    delAllX(X, L, NewList).

delAllX(X, [Y | L], [Y | NewList]) :-
    X \= Y, 
    delAllX(X, L, NewList),
    !.

% Обьединение списков
customAppend([], List2, List2).

customAppend([Head | Body], List2, [Head | SerchTail]) :-
	customAppend(Body, List2, SerchTail).

% Кастомный лист
customListStep(_, _, 0, []) :- !.

customListStep(Curr, Step, N, List) :-
    N >= 0,
    NewCurr is Curr + Step,
    NewN is N - 1, 
    customListStep(NewCurr, Step, NewN, TempList), 
	customAppend([Curr], TempList, List).

% 1. Сформировать список [2, 4, 6, 8, 10] и удалить из него введенное число.

task1(N, X, List) :-
    evenList(N, TempList),
    delAllX(X, TempList, List), 
    !.

% 2. Сформировать списки [1, 3, 5, 7, 9] и [2, 4, 6, 8, 10] и объединить их в один.

task2(N, List) :-
    evenList(N, EvenList),
    oddList(N, OddList),
    customAppend(OddList, EvenList, List).

% 3. Сформировать список [3, 6, 9, 12, 15, 18] и вставить в него введенное число.

task3(X, List) :-
	customListStep(3, 3, 6, TempList),
    customAppend(TempList, [X], List).

% 4. Сформировать список из N натуральных чисел, начиная с 10. Каждое следующее на 5 больше предыдущего.

task4(N, List) :-
    customListStep(10, 5, N,  List).

% 5. Сформировать список [3, 6, 9, 12, 15] и найти сумму его элементов.

task5(Sum) :-
	customListStep(3, 3, 5, List),
    listSum(List, Sum).

% 6. Сформировать список [6, 5, 4, 3, 2] и найти сумму его элементов.

task6(Sum) :-
	customListStep(6, -1, 5, List),
    listSum(List, Sum).

% 7. Сформировать список [7, 5, 3, 1] и найти произведение  его элементов.
task7(Mult) :-
	customListStep(7, -2, 4, List),
    listMult(List, Mult).

% 8. Сформировать список из N последовательных натуральных чисел, начиная с 10. Найти сумму его элементов.
task8(N, Sum) :-
    customListStep(10, 1, N, List),
    listSum(List, Sum).