(*
fresh string is generated using only a, b and c characters
1. Empty list case    :returning just string "a"
2. Non Empty list case: Check ith character in the ith string
                         if other than a and b: add c to the final string
                         if a                 : add b to the final string
                         if b                 : add a to the final string
3. This way we will get fresh string of length equal to the length of the list
*)
fun diff (st, x) = let val l = String.size(st)
                   in
		       if Int. <= (l, x)
		       then
			   #"c"
		       else
			   if Char.compare(String.sub(st, x), #"a") = EQUAL
			   then
			       #"b"
			   else
			       #"a"
		   end;

fun helper ([], _)      = ""
  | helper ((x::xs), l) = String.concat([String.str(diff(x, l - List.length(xs) -1)), helper(xs, l-1)]);

fun fresh [] = "a"
  | fresh ys = helper(ys, List.length(ys));
