% Лабораторная работа N 2 “Рекурсия” 


% 1. Вычислить сумму: 1+2+3+…+N.

sumRow(1, 1) :- !.

sumRow(X, Sum) :-
    X >= 1,
    TempX is X - 1, 
    sumRow(TempX, TempSum),
    Sum is TempSum + X.


% 2. Подсчитать сумму ряда целых четных чисел от 2 до N.

sumEven2ToN(N, Sum) :- 
    N >= 2,
    (mod(N, 2) =:= 0 ->  
    	EvenN is N;
    	EvenN is N - 1),
    evenStep(EvenN, TempSum),
    Sum is TempSum + EvenN.

evenStep(2, 0) :- !.

evenStep(N, Sum) :-     
    NewN is N - 2,
    evenStep(NewN, TempSum),  
    Sum is TempSum + NewN.


% 3. Вычислить сумму ряда целых нечетных чисел от 1 до n.

sumOdd1ToN(N, Sum) :- 
    N >= 1,
    (mod(N, 2) =:= 0 ->  
    	OddN is N - 1;
    	OddN is N),
    oddStep(OddN, TempSum),
    Sum is TempSum + OddN.

oddStep(1, 0) :- !.

oddStep(N, Sum) :-     
    NewN is N - 2,
    oddStep(NewN, TempSum),  
    Sum is TempSum + NewN.


% 4. Найти значение произведения: 2*4*6*...*26

multEven2ToN(N, Mult) :- 
    N >= 2,
    (mod(N, 2) =:= 0 ->  
    	EvenN is N;
    	EvenN is N - 1),
    evenStep(EvenN, TempMult),   
    Mult is TempMult * EvenN.

evenStep(2, 1) :- !.

evenStep(N, Mult) :-     
    NewN is N - 2,
    evenStep(NewN, TempMult),  
    Mult is TempMult * NewN.


% 5. Найти значение произведения: 1*3*5*...*11

multOdd1ToN(N, Sum) :- 
    N >= 1,
    (mod(N, 2) =:= 0 ->  
    	OddN is N - 1;
    	OddN is N),
    oddStep(OddN, TempMult),
    Sum is TempMult * OddN.

oddStep(1, 1) :- !.

oddStep(N, Mult) :-     
    NewN is N - 2,
    oddStep(NewN, TempMult),  
    Mult is TempMult * NewN.