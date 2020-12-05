(*EDUARDO PÉREZ FRAGUELA*)

(*let rec suml = function
	[] -> 0
	| h::t -> h + suml t;;*)

let suml l = 
	let rec aux a = function
		[] -> a
		| h::t -> aux(a+h) t
	in aux 0 l;;

(*let rec maxl = function
	[] -> raise (Failure "maxl")
	| h::[] -> h
	| h::t -> max h (maxl t);;*)

let maxl l = 
	let rec aux l m = match l with
		|[] -> raise (Failure "maxl")
		|h::[] -> max h m
		|h::t -> if h > m then aux t h
			 else aux t m
	in aux l (List.hd l);;

(*let rec to0from n =
	if n < 0 then []
	else n :: to0from (n-1);;*)

let to0from n =
	let rec aux l i =
		if i > n then l
		else aux (i::l) (i+1)
	in aux [] 0;;

(*let rec fromto m n =
	if m > n then []
	else m :: fromto (m+1) n;;*)

let fromto m n =
	let rec aux l i =
		if i < m then l
		else aux (i::l) (i-1)
	in aux [] n;;

(*let rec from1to n =
	if n < 1 then []
	else from1to (n-1) @ [n];;*)

let from1to n =
	let rec aux l i =
		if i < 1 then l
		else aux (i::l) (i-1)
	in aux [] n;;

(*let append =
	List.append;;*)

let append l1 l2 =
	 List.rev_append (List.rev l1) l2;;

(*let map =
	List.map;;*)

let map f l =
	let rec aux f l acc = match l with
		[] -> List.rev acc
		| h::t -> aux f t ((f h)::acc)		
	in aux f l [];;

(*let power x y =
	let rec innerpower x y =
		if y = 0 then 1
		else x * innerpower x (y-1)
	in
		if y >= 0 then innerpower x y
		else invalid_arg "power";;*)

let power x y =
	let rec innerpower x y acc =
		if y=0 then acc
		else innerpower x (y-1) (x*acc)
	in
	if y >= 0 then innerpower x y 1
	else invalid_arg "power";;

(*let incseg l =
	List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;*)

let incseg l = 
	let rec aux l acc l2 = match l with
		[] -> []
		| [h] -> List.rev ((h+acc)::l2)
		| h::t -> aux t (h+acc) ((h+acc)::l2)
	in aux l 0 [];;

(*let rec remove x = function
	[] -> []
	| h::t -> if x = h then t
		  else h :: remove x t;;*)

let rec remove x l = 
	let rec aux a = function
		[] -> l
		|hd::tl -> if x = hd
		then List.rev_append a tl
		else aux (hd::a)tl
		in aux [] l;;

(*let rec insert x = function
	[] -> [x]
	| h::t -> if x <= h then x::h::t
		  else h :: insert x t;;*)

let insert x l =
	let rec aux x l l2 flag = match l,flag with
		_,false -> List.rev_append l2 l
		| [],_ -> List.rev_append  l2 [x]
		| h::t, true -> if x<=h then aux x t (h::x::l2) false
					else aux x t (h::l2) true
	in aux x l [] true;;

(*let rec insert_gen f x l = match l with
	[] -> [x]
	| h::t -> if f x h then x::l
		  else h :: insert_gen f x t;;*)

let rec insert_gen f x l =
	let rec aux f x l l2 flag = match l,flag with
		  [],_ -> List.rev_append l2 [x]
		| _,false -> List.rev_append l2 l
		| h::t, true -> if f x h then aux f x t (h::x::l2) false
					else aux f x t (h::l2) true
	in aux f x l [] true;;
    
