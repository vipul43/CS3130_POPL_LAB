(*  Question-3
    base case when list is empty, length of the list is 0.
    length of list x::xs is length of list xs + 1
    length(it is a function) type => fn : 'a list -> int
    x  	      	   	     type => 'a
    xs 			     type => 'a list
*)
fun length [] = 0
  | length (x::xs) = 1 + length xs;
