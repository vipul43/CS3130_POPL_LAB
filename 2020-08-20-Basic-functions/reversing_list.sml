(*  Question-4
    base case is when list is empty, its reverse is also empty.
    reverse of x:: xs is reverse of xs appended to [x].
    reverse(it is a function) type => fn : 'a list -> 'a list
    x	       	    	      type => 'a
    xs			      type => 'a list
    reverse_helper	      type => ('a list -> 'a list) -> 'a list
    ys			      type => 'a list
*)
(* TIME COMPLEXITY OF BELOW FUNCTION IS O(n^2)
   fun reverse [] = []
     | reverse (x::xs) = (reverse xs) @ [x];
*)
fun reverse xs =
    let
	fun reverse_helper [] ys = ys
	  | reverse_helper (x::xs) ys = reverse_helper xs (x::ys)
    in
	reverse_helper xs []
    end;
