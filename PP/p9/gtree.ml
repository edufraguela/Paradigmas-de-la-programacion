(*EDUARDO PÉREZ FRAGUELA*)

type 'a g_tree = Gt of 'a * 'a g_tree list;;

let rec breadth_first = function
	Gt (x, []) -> [x]
	| Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

let breadth_first_t a =
	let rec aux a l = match a with
		Gt (x, []) -> List.rev(x::l)
		| Gt (x,(Gt (y, t2))::t1) -> aux (Gt (y, List.rev_append (List.rev t1) t2)) (x::l)
	in aux a [];;
		
let t = 
	let rec aux i = function
	Gt (x, p1) -> if i >= 100000 then
			Gt (x, p1)
			else aux (i+1) (Gt (i, [Gt (x, p1)]))
	in aux 0 (Gt (0, []));;
