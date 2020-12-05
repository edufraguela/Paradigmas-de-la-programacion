(*EDUARDO PÉREZ FRAGUELA*)

let f = function x -> x;;

let g = function x -> (x,x);;

let h = function (a,_) -> a;;

let i = function (_,b) -> b;;

let j = function x -> [x];;

(*Tan solo se puede escribir una función para cada uno de esos tipos excepto para la función j, de la cual se pueden escribir infinitas funciones*)

let k x = raise(Invalid_argument "x");;
let rec l x = List.rev(l x);;

(*let fun_123_ab f = f[1;2;3] + f['a'+'b'];;
 No se puede hacer, ya que el tipo de esa función ha de ser (int list -> int) -> int*)
