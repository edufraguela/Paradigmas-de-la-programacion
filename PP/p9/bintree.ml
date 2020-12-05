(*EDUARDO PÉREZ FRAGUELA*)

type 'a bin_tree = Empty | Node of 'a * 'a bin_tree * 'a bin_tree;;

let breadth_first a =
   let rec aux b = function
      [] -> List.rev b
      |Empty::t -> aux b t
      |Node (x, Empty, Empty)::t -> aux (x::b) t
      |Node (x, r, Empty)::t
      |Node (x, Empty, r)::t -> aux (x::b) (List.append t [r])
      |Node (x, r, l)::t -> aux (x::b) (List.append t [r; l])
   in aux [] [a];; 

