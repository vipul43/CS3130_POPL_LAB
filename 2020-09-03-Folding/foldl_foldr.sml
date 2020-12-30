(*
    foldl: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f    : ('a * 'b -> 'b)
    x    : 'b
    foldr: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f    : ('a * 'b -> 'b)
    x    : 'b
*)
fun foldl f x []      = x
  | foldl f x (y::ys) = foldl f (f(y, x)) ys;
fun foldr f x []      = x
  | foldr f x (y::ys) = f(y, (foldr f x ys));
