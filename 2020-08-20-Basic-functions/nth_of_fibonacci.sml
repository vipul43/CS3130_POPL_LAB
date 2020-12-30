(*  Question-5
    fib(it is a function) type => fn : int -> int
    n 	      		  type => int
    x			  type => int
    y			  type => int
    fib_helper		  type => fn : (int * int * int) -> int
*)
(* TIME COMPLEXITY OF BELOW FUNCTION IS O(2^n)
   fun fib 0 = 0
     | fib 1 = 1
     | fib n = fib (n-1) + fib (n-2);
*)
fun fib n =
    let
	fun fib_helper (x, y, 1) = y
	  | fib_helper (x, y, n) = fib_helper (x+y, x, n-1)
    in
	fib_helper (1, 0, n)
    end;
