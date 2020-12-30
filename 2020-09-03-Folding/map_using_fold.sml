(*
    foldr: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f    : ('a * 'b -> 'b)
    x    : 'b
    map  : ('a -> 'b) -> 'a list -> 'b list
*)
fun foldr f x []      = x
  | foldr f x (y::ys) = f(y, (foldr f x ys));

fun map f = foldr (fn (x, xs) => f x :: xs) [];
