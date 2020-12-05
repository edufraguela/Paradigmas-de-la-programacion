(*EDUARDO PÉREZ FRAGUELA*)

let rec split = function
	[] -> [], []
	| h::[] -> [h],[]
	| h1::h2::t -> let t1,t2 = split t in (h1::t1, h2::t2);;

let rec merge ord l1 l2 = match l1,l2 with
	[],l | l,[] -> l
	| h1::t1, h2::t2 -> if ord h1 h2 then h1::merge ord t1 l2
			    else h2::merge ord l1 t2;;

let rec msort1 ord l = match l with
	[] | _::[] -> l
	| _ -> let l1, l2 = split l in
	       merge ord (msort1 ord l1) (msort1 ord l2);;

(* ¿Puede provocar algún problema la no terminalidad de split o merge? 
   Si, pues al no ser terminales no pueden ordenar listas de gran tamaño*)

let rlist r n =
  let rec aux (i, l) =
    if (i > n) then l
      else aux(i+1, Random.int r::l)
 in aux(1, []);;

let l2 = rlist 300_000 300_000;;

let rec split_t l = 
	let rec aux a b = function
		[] -> (a, b)
		| h::[] -> (h::a, b)
		| h1::h2::t -> aux (h1::a) (h2::b) t
	in aux [] [] l;;

let rec merge_t ord l1 l2 =
	let rec aux a = function
		[],l | l,[] -> List.rev_append a l
		| h1::t1, h2::t2 -> if ord h1 h2 then aux (h1::a) (t1, h2::t2)
				    else aux (h2::a) (h1::t1, t2)
	in aux [] (l1, l2);;

let rec msort2 ord l = match l with
	[] | _::[] -> l
	| _ -> let l1, l2 = split_t l in
	       merge_t ord (msort2 ord l1) (msort2 ord l2);;

(* msort2 no ofrece ninguna mejoría con respecto al rendimiento de tiempo de ejecucuión con msort1, ya que
ambos tiempos son muy similares, pero si la ofrece con respecto a qsort3 si la lista que se le pasa está ordenada,
tanto ascendente como descendentemente *)
