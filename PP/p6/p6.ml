(*EDUARDO PÉREZ FRAGUELA*)

let split l =
	(List.map fst l, List.map snd l);;

let combine l1 l2 =
	List.map2 (function x -> function y -> (x,y)) l1 l2;;

let length l =
	 List.fold_left (function aux -> function _ -> aux+1) 0 l;;

let append l1 l2 =
	List.fold_right (fun x y -> x::y) l1 l2;;

let rev l =
	List.fold_left (fun aux x -> x::aux) [] l;;

let concat l = 
	List.fold_left (@) [] l;;

let partition p l =
	(List.filter p l, List.filter (function x -> not(p x)) l);;

let remove_all x l = 
 	let f y = y <> x in
  		List.filter f l;;

let ldif l1 l2 =
	List.fold_right remove_all l2 l1;;

let lprod l1 l2=
	List.concat (List.map (function h-> List.map (function h2 -> (h,h2)) l2) l1);;

let comp = 
	function f -> function g -> function x -> f(g(x));;

let multicomp = function
	[] -> raise(Invalid_argument"multicomp")
	|(h::t) -> List.fold_left comp h t;;
