(*EJERCICIO OPCIONAL*)
(*EDUARDO PÉREZ FRAGUELA*)

let rec remove a l = match l with 
  [] -> l
| h::t -> if (a==h) then t
	  else h::(remove a t);;
(*val remove : 'a -> 'a list -> 'a list = <fun>*)

let rec remove_all a l = match l with
	[] -> []
| h::t -> if (a==h) then (remove_all a t)
	  else h::(remove_all a t);;
(*val remove_all : 'a -> 'a list -> 'a list = <fun>*)

let rec ldif l1 l2 = match (l1,l2) with
  h1::t1, h2::t2 -> ldif (remove_all h2 l1) t2
| _ -> l1;;
(*val ldif : 'a list -> 'a list -> 'a list = <fun>*)

let lprod l1 l2 =	
	let rec aux acc = function
		  [],_ -> ref acc
		| _::t1,[] -> aux acc (t1,l2)
		| h1::t1,h2::t2 -> aux ((h1,h2)::acc) (h1::t1,t2)
	in aux [] (l1,l2);;
(*val lprod : 'a list -> 'b list -> ('a * 'b) list ref = <fun>*)

let divide l =
  let rec aux acc acc2 = function
					  [h] -> (ref (h::acc), ref acc2)
					| [] -> (ref acc, ref acc2)
					| h::t -> aux (h::acc) (hb t::acc2) (tl t)
				in aux [] [] l;;