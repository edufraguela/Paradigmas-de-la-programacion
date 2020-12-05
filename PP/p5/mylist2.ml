(*EDUARDO PÉREZ FRAGUELA*)

let hd l = match l with
| h::_ -> h
| [] -> raise (Failure "hd");;
(*val hd : 'a list -> 'a = <fun>*)

let tl l = match l with
| _::t-> t
| [] -> raise (Failure "tl");;
(*val tl : 'a list -> 'a list = <fun>*)

let rec nth l n = 
if(n == 0) then hd l 
else if(n > 0) then nth (tl l)(n-1)
  else if(n < 0) then raise (Invalid_argument "List.nth")
    else raise (Failure "nth");;
(*val nth : 'a list -> int -> 'a = <fun>*)

let rec init len f = match len, f with
 0, f -> []
 |len, f -> if (len > 0) then (init (len - 1) f) @ [f len]
            else raise(Failure "init");;
(*val init : int -> (int -> 'a) -> 'a list = <fun>*)

let rev_map f l =
  let rec aux i = function
      [] -> i
      |h::l -> aux (f h::i) l
  in aux [] l;;
(*val rev_map : ('a -> 'b) -> 'a list -> 'b list = <fun>*)

let rec map2 f l1 l2 =
  match (l1,l2) with
    [], [] -> []
  | h1::t1, h2::t2 -> (f h1 h2) :: (map2 f t1 t2)
  | _-> raise (Invalid_argument "map2");;
(*val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list = <fun>*)

let rec find p = function
  [] -> raise Not_found
| h::t -> if p h then h else find p t;; 
(*val find : ('a -> bool) -> 'a list -> 'a = <fun>*)

let rec combine l1 l2 =
 match (l1,l2) with
  [], [] -> []
  | h1::t1, h2::t2 -> (h1,h2) :: (combine (t1) (t2))
  | _ -> raise (Invalid_argument "combine");;
(*val combine : 'a list -> 'b list -> ('a * 'b) list = <fun>*)

let length l =
let rec aux a = function
	[] -> a
	| h::t -> aux (a+1) t
  in aux 0 l;;
(*val length : 'a list -> int = <fun>*)

let compare_lengths = function l1 -> function l2 ->
   if length l1 = length l2 then 0
   else 1;;
(*val compare_lengths : 'a list -> 'b list -> int = <fun>*)

let rec append l1 l2 = 
if l1=[] then l2
else (hd l1)::(append(tl l1) l2);;
(*val append : 'a list -> 'a list -> 'a list = <fun>*)

let rev l =
	let rec aux l a = match l with
	  [] -> a
	| h::t -> aux t (h::a)
  in aux l [];; 
(*val rev : 'a list -> 'a list = <fun>*)

let rev_append l1 l2 = match (l1,l2) with
  [],[] -> []
| [],h::t -> h::t
| h::t,[] -> rev (h::t)
| h1::t1,h2::t2 -> let rec aux acc l1 l2 = match (l1,l2) with
  		     [],[] -> rev acc
  		   | [],h2::t2 -> aux (h2::acc) [] (t2)
  		   | [h1],h2::t2 -> aux (rev (h1::acc)) [] (h2::t2)   
  		   | h1::t1,h2::t2 -> aux (h1::acc) (t1) (h2::t2)
  		   | _,_ -> raise (Failure "rev_append")
	in aux [] l1 l2;;
(*val rev_append : 'a list -> 'a list -> 'a list = <fun>*)

let rec concat = function
  [] -> []
| h::t -> append h (concat t);;
(*val concat : 'a list list -> 'a list = <fun>*)

let flatten = concat;;
(*val flatten : 'a list list -> 'a list = <fun>*)

let rec map f = function
  [] -> []
| h::t -> (f h) :: (map f t);;
(*val map : ('a -> 'b) -> 'a list -> 'b list = <fun>*)

let rec fold_left f a = function
  [] -> a
| h::t -> fold_left f (f a h) t;;
(*val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun>*)

let rec fold_right f l a =
  match l with
   [] -> a
 | h::t -> f h (fold_right f t a);;
(*val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b = <fun>*)

let rec for_all p = function
  [] -> true
| h::t -> (p h) && (for_all p t);;
(*val for_all : ('a -> bool) -> 'a list -> bool = <fun>*)

let rec exists p = function
  [] -> false
| h::t -> (p h) || (exists p t);;
(*val exists : ('a -> bool) -> 'a list -> bool = <fun>*)
	
let rec mem p = function
  [] -> false
| h::t -> if (p = h) then true
			else (mem p t);;
(*val mem : 'a -> 'a list -> bool = <fun>*)

let filter p l =
	let rec aux si no = function
		[] -> rev si
		| h::t -> if (p h) then aux (h::si) no t
				else aux si no t
	in aux [] [] l;;
(*val filter : ('a -> bool) -> 'a list -> 'a list = <fun>*)

let find_all = filter;;
(*val find_all : ('a -> bool) -> 'a list -> 'a list = <fun>*)

let partition p l =
	let rec aux si no = function
		[] -> (rev si, rev no)
		| h::t -> if (p h) then aux (h::si) no t
				else aux si (h::no) t
	in aux [] [] l;;
(*val partition : ('a -> bool) -> 'a list -> 'a list * 'a list = <fun>*)

let rec split = function
  [] -> ([],[])
| (h1,h2)::t -> let t1,t2 = split t in
		h1::t1,h2::t2;;
(*val split : ('a * 'b) list -> 'a list * 'b list = <fun>*)



