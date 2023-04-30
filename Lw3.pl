% Лабораторная работа N 3 “Решение логических задач” 

/*
1. Трое ребят вышли гулять с собакой, кошкой и хомячком. 
Известно, что Петя не любит кошек и живет в одном подъезде с хозяйкой хомячка. 
Лена дружит с Таней, гуляющей с кошкой. 
Определить, с каким животным гулял каждый из детей.
 */

name("Petya").
name("Lena").
name("Tanya").

animal("dog").
animal("cat").
animal("hamster").

ownerInfo(X, Y) :- 
	name(X),
    X = "Petya",
    animal(Y),
    Y \= "cat".

ownerInfo(X, Y) :- 
    name(X),
    X = "Lena",
    animal(Y).

ownerInfo(X, Y) :- 
	name(X),
    X = "Tanya",
    animal(Y),
    Y = "cat". 

matches(X1, Y1, X2, Y2, X3, Y3) :-  
	X1 = "Petya", 
    ownerInfo(X1, Y1),
    X2 = "Lena", 
    ownerInfo(X2, Y2),
    X3 = "Tanya", 
    ownerInfo(X3, Y3),
    Y1 \= Y2, 
    Y1 \= Y3, 
    Y2 \= Y3, 
    !.

/* ?- 
matches(X1, Y1, X2, Y2, X3, Y3),
write(X1), write(" - "), write(Y1), writeln(""),
write(X2), write(" - "), write(Y2), writeln(""),
write(X3), write(" - "), write(Y3), writeln("").
*/

/* 2. Витя, Юра, Миша и Дима сидели на скамейке. 
В каком порядке они сидели, если известно, что 
Юра сидел справа от Димы, 
Миша справа от Вити, а 
Витя справа от Юры. */

right("Yura", "Dima").
right("Misha", "Vitya").
right("Vitya", "Yura").

row(X, Y, Z, W) :- 
    right(Y, X), 
    right(Z, Y),
    right(W, Z), 
    !.

дима юра

/* ?- 
row(X, Y, Z, W),
write(X), write(" "), write(Y), write(" "), write(Z), write(" "), write(W).
*/

right("Yura", "Dima").
right("Misha", "Dima").
right("Vitya", "Yura").




/* 2. Витя, Юра, Миша и Дима сидели на скамейке. 
В каком порядке они сидели, если известно, что 
Юра сидел справа от Димы, 
Миша справа от Вити, а 
Витя справа от Юры. */

h("Yura").
h("Dima").
h("Misha").
h("Vitya").

right(X,Y) :-
    (X =:= "Yura", Y \= "Dima"   );
    (   );
    (   );
    
right("Yura", "Dima") :- false, !.
right("Misha", "Vitya") :- false, !.
right("Vitya", "Yura") :- false, !.

right(X, Y) :- X \= Y.
    
    
row([X, Y, Z, W]) :- 
    h(X),h(Y),h(Z),h(W),
   (   right(Y, X), right(Z, X), right(W, X)),
   (   right(Z, Y), right(W, Y)),
   right(W, Z),
       X \= Y, X \= Z, X \= W, 
       Y \= Z, Y \= W, 
    Z \= W.