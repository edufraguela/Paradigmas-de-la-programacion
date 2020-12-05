(*EDUARDO PÉREZ FRAGUELA*)

let hanoi (x,y,z) m =
  let rec solve x y z n = match n with
  |0 -> []
  |_ -> solve x y z (n-1) @ (x,y) :: (solve z y z (n-1)) 
  in solve x z y  m;;
