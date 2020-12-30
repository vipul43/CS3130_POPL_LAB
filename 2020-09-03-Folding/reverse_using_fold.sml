(*
    foldl: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f    : ('a * 'b -> 'b)
    x    : 'b
    rev  : ('a list -> 'a list)
    l    : 'a list
*)
fun foldl f x []      = x
  | foldl f x (y::ys) = foldl f (f(y, x)) ys;

fun rev l = foldl List.:: [] l;
