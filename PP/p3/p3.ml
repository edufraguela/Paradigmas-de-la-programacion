(*EJERCICIO 1*)

let f = function x -> function y -> function z ->
(z > y) || ((x <> y) && (z / (x - y) > y));;

let f = function x -> function y -> function z ->
if (z > y) then true else (if (x <> y) then (z / (x - y) > y) else false);;

false && (2 / 0 > 0);;
(*-: bool = false*)

(*true && (2 / 0 > 0);;*)
(*Exception: Division_by_zero*)

true || (2 / 0 > 0);;
(*-: bool = true*)

(*false || (2 / 0 > 0);;*)
(*Exception: Division_by_zero*)

let con = (&&);;
(*val con : bool -> bool -> bool = <fun>*)

let dis = (||);;
(*val dis : bool -> bool -> bool = <fun>*)

(&&) (1 < 0) (2 / 0 > 0);;
(*- : bool = false*)

(*con (1 < 0) (2 / 0 > 0);;*)
(*Exception: Division_by_zero*)

(||) (1 > 0) (2 / 0 > 0);;
(*- : bool = true*)

(*dis (1 > 0) (2 / 0 > 0);;*)
(*Exception: Division_by_zero*)

(*EJERCICIO 2*) 

let curry = function f -> function b -> function c -> f(b,c);;
(*val curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = <fun>*)

let uncurry = function g -> (function (a,b)-> g a b);;
(*val uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c = <fun>*)

uncurry (+);;
(*- : int * int -> int = <fun>*)

let sum = (uncurry (+));;
(*val sum : int * int -> int = <fun>*)

(*sum 1;;*)
(*ERROR: Esta expresion es de tipo int pero esperaba ser de tipo int*int *)

sum (2,1);;
(*- : int = 3*)

let g = curry (function p -> 2 * fst p + 3 * snd p);;
(*val g : int -> int -> int = <fun>*)

(*g (2,5);;*)
(*Error: Esta expresion tiene tipo 'a * 'b pero la esperada es de tipo int*)

let h = g 2;;
(*val h : int -> int = <fun>*)

h 1, h 2, h 3;;
(*- : int * int * int = (7, 10, 13)*)

(*EJERCICIO 3*)

let comp x y arg = x(y(arg));;
(*val comp : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun>*)

let f2 = let square x = x * x in comp square ((+)1);;
(*val f2 : int -> int*)

f2 1, f2 2, f2 3;;
(*- : int * int * int = (4, 9, 16)*)






