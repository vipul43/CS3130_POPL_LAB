(*
    foldr    : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f        : ('a * 'b -> 'b)
    x        : 'b
    partition: ('a -> bool) -> 'a list -> 'a list * 'a list
    f        : ('a -> bool)
    l        : 'a list
*)
fun foldr f x []      = x
  | foldr f x (y::ys) = f(y, (foldr f x ys));
fun partition f l = foldr (fn(x,xs) => if (f x) then (x::(#1(xs)), #2(xs)) else (#1(xs), x::(#2(xs)))) ([],[]) l;
