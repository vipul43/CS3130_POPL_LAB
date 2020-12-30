(*
    foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
    f     : ('a * 'b -> 'b)
    x     : 'b
    nth   : 'a list * int -> 'a option
*)
fun foldl f x []      = x
  | foldl f x (y::ys) = foldl f (f(y, x)) ys;
datatype 'a option = find of int
		   | check of 'a;
fun nth (xs,b) = let fun helper (x, find(b)) = if(b=0) then check(x) else find(b-1)
		      | helper (x, check(xs))= check(xs);
		in foldl helper (find(b)) xs
		end;
