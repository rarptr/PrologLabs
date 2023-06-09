% Лабораторная работа №1 “Арифметические вычисления”


% 1. Составить программу для вычисления значения выражения Y=(X2+1)/(X-2) для введенного X.
calculateY(X, Y) :- 
    X =\= 2, Y is (X * X + 1) / (X - 2).

% 2. Составить программу для вычисления значения выражения S=2(X2+Y2)/(X+Y) для введенных X и Y.
calculateS(X, Y, S) :- 
    X + Y =\= 0, S is (X * X + Y * Y) / (X + Y).

% 3. Составить программу для вычисления среднего арифметического двух введенных чисел.
calcArithmeticMean(X1, X2, AM) :- 
    AM is (X1 + X2) / 2.

% 4. Составить программу для вычисления среднего геометрического двух введенных чисел. 
calcGeometricMean(X1, X2, GM) :- 
    GM is sqrt(X1 * X2).

% 5. Составить программу для проверки введенного натурального числа на четность. 
isEven(X) :- 
    mod(X, 2) =:= 0.

% 6. Составить программу для проверки попадает ли введенное число X в заданный промежуток [a, b].
intervalIncludX(A, B, X) :- 
    A <= X, B >= X. 

% 7. Составить программу для выбора наименьшего из трех введенных чисел.

getMin(X1, X2, X3, Min) :- 
    firstIsMin(X1, X2, X3, Min), !; 
    firstIsMin(X2, X1, X3, Min), !; 
    firstIsMin(X3, X1, X2, Min).

firstIsMin(X1, X2, X3, Min) :- 
    X1 =< X2, X1 =< X3, Min is X1.


% 8. Составить программу для выбора наибольшего из трех введенных чисел.

getMax(X1, X2, X3, Max) :- 
    firstIsMax(X1, X2, X3, Max), !; 
    firstIsMax(X2, X1, X3, Max), !; 
    firstIsMax(X3, X1, X2, Max).

firstIsMax(X1, X2, X3, Max) :- 
    X1 >= X2, 
    X1 >= X3, 
    Max is X1.