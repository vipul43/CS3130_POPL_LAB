(* normal representation of lambda calculus *)
datatype lam = V of string
             | A of lam * lam
             | L of string * lam;

(* HOAS representation of lambda calculus *)
datatype hlam = HV of string
              | HA of hlam * hlam
              | HL of hlam -> hlam;

(* ANSWER *)
(* FUNCTIONS FROM PREVIOUS LABS *)
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

(* NEW FUNCTIONS *)
structure set = ListSetFn(struct
			  type ord_key = string
			  val compare  = String.compare
			  end);

fun change x = x:string;

fun convert expr = let fun helper (HV x) N             = set.add(N, x)
			 | helper (HA (expr1,expr2)) N = set.union(helper expr1 N, helper expr2 N)
			 | helper (HL f) N             = set.add(N, "ABC")
		   in List.map change (set.listItems(helper expr set.empty))
		   end;

fun freshen (expr)  = fresh (convert expr);
