(*  Question-1
    curry(it is a function) type => fn : ('a * 'b -> 'c) -> ('a -> 'b -> 'c)
    A(it is a function) type => 'a * 'b -> 'c
    B(it is a function) type => 'a -> 'b -> 'c
    f(it is a function) type => 'a * 'b -> 'c
    x 	      		type => 'a
    y 			type => 'b
    z 			type => 'c
    uncurry(it is a function) type => fn : ('a -> 'b -> 'c) -> ('a * 'b -> 'c)
    A(it is a function) type => 'a -> 'b -> 'c
    B(it is a function) type => 'a * 'b -> 'c
    f(it is a function) type => 'a -> 'b -> 'c
    x 	      		type => 'a
    y 			type => 'b
    z 			type => 'c
*)
fun curry f x y z = f (x, y, z);
fun uncurry f (x, y, z) = f x y z;
