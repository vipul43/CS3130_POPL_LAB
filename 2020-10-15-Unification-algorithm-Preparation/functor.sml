(* ORD_KEY signature to make comparisons between mentioned datatypes *)
datatype comp = smaller | equal | greater;
signature ORD_KEY = sig
    type ord_key;
    val compare : ord_key * ord_key -> comp;
end;

(* defining SML signature to capture the signature set which is a set of functional symbols and arity corresponding to each functional symbol *)
signature SIG = sig
    type functional_symbol;                                         (* type to capture the functional symbol itself *)
    val arity : functional_symbol -> int;                           (* function to capture the arity associated with each functional symbol *)
    structure ORD : ORD_KEY where type ord_key = functional_symbol; (* structure ORD to compare functional symbols *)
end;

(* defining SML signature to capture the signature set of variables only *)
signature VAR = sig
    type variable;                                         (* type to capture variables itself *)
    structure ORD : ORD_KEY where type ord_key = variable; (* structure ORD to compare variables *)
end;

(* Functor *)
functor Term(structure S:SIG
	     structure V:VAR) = struct
	datatype term = s of S.functional_symbol                  (* term captures functional symbols and variables *)
		      | v of V.variable
		      | APP of S.functional_symbol * (term list);
	(* in case where the term is variable just need to check whether that variable is the input variable or not *)
	(* in case where the term is functional symbol, as functional symbol cannot be a variable the answer is always false *)
	(* in case where the term is functional symbol application then check whether the term list contains the input variable or not*)
	fun occurs (v(var): term,        x: V.variable) = if V.ORD.compare(var, x) = equal then true else false
	  | occurs (s(f): term,          x: V.variable) = false
	  | occurs (APP(f, li): term,    x: V.variable) = let fun unrolling ([], x)    = false
								| unrolling (y::ys, x) = if occurs (y, x) then true else unrolling (ys, x)
							  in unrolling (li, x)
							  end;
end;
