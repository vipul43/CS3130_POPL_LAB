(*
    foldl: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f    : ('a * 'b -> 'b)
    x    : 'b
    add  : (int * int) -> int
    sum  : int list -> int
*)
fun foldl f x []      = x
  | foldl f x (y::ys) = foldl f (f(y, x)) ys;
fun add (x, y) = x + y;
val sum  = foldl add 0;
