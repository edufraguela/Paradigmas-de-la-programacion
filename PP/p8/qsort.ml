(*EDUARDO PÉREZ FRAGUELA*)

open List;;

let rec qsort1 ord = function
	[] -> []
	| h::t -> let after, before = partition (ord h) t in
		qsort1 ord before @ h :: qsort1 ord after;;

(* ¿En qué casos no será bueno el rendimiento de esta implementación?
   Esta implementación no será buena en casos en los que la lista sea muy grande, ya que dará stack overflow,
   cuando la lista este ordenada tanto en orden ascendente como descendente*)

let rec qsort2 ord = function
	[] -> []
	| h::t -> let after, before = partition (ord h) t in
		rev_append (rev (qsort2 ord before)) (h :: qsort2 ord after);;

let rlist r n =
  let rec aux (i, l) =
    if (i > n) then l
      else aux(i+1, Random.int r::l)
 in aux(1, []);;

let l1 = rlist 300_000 300_000;;

(* ¿Tiene qsort2 alguna ventaja sobre qsort1? ¿Permite qsort2 ordenar listas que no podrían ordenarse con qsort1?
   Si, la ventaja es que es terminal, por lo que permite ordenar listas muy grandes sin stack overflow
¿Tiene qsort2 alguna desventaja sobre qsort1?
Si, es más lento, aproximadamente un 8%, ya que tiene que darle la vuelta a la lista de elementos menores que la cabeza *)

let qsort3 ord l =
	let rec sort_asc = function
		[] -> []
		| h::t -> let after,before = partition (ord h) t in rev_append(sort_des before)(h::sort_asc after)
	and sort_des = function
		[] -> []
		| h::t -> let before,after = partition (ord h) t in rev_append(sort_asc before)(h::sort_des after)  
	in sort_asc l;;

(*¿Puede apreciarse un cambio de rendimiento en tiempo de ejecución de qsort3 respecto a qsort2?
  Si, aproximadamente un 15%
¿Y respecto a qsort1?
No, pues los resultados son similares *)
