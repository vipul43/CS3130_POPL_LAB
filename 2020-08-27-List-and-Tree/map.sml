(*
 map:     ('a -> 'b) -> 'a list -> 'b list
 f:       ('a -> 'b)
 (x::xs): 'a list
 xs: 	  'a list
*)

fun map f []      = []
  | map f (x::xs) = [f x] @ map f (xs);
