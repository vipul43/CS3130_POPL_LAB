
(* ORD_KEY signature to make comparisons between mentioned datatypes *)
signature ORD_KEY = sig
    type ord_key;
    val compare : ord_key * ord_key -> order;
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
        fun occurs (s(f),          x: V.variable) = false
	  | occurs (v(var),        x: V.variable) = if V.ORD.compare(var, x) = EQUAL then true else false
          | occurs (APP(f, li),    x: V.variable) = let fun unrolling ([], x)    = false
                                                          | unrolling (y::ys, x) = if occurs (y, x) then true else unrolling (ys, x)
                                                    in unrolling (li, x)
                                                    end;
end;

(* Capturing Telescope  *)
functor Telescope(structure S:SIG
		  structure V:VAR) = struct
	structure term          = Term(structure S=S structure V=V); (* getting the term structure from the previously defined functor *)
	structure RedBlackMap   = RedBlackMapFn(V.ORD);              (* getting the structure of red black map, to use its predefined functions *)
	type telescope          = term.term RedBlackMap.map;         (* red black map of type term for capturing telescope *)

	(* if variable is present in the telescope as a key then replace the variable with the value corresponding to the variable in telescope *)
	fun replace_key_with_value(T:telescope, term.s(f))         = term.s(f)                                              (* functional symbol doesnt have any variables so return as it is *)
	  | replace_key_with_value(T:telescope, term.v(var))       = (case RedBlackMap.find(T, var) of                      (* if variable is present then return the corresponding value *)
									  SOME value => replace_key_with_value(T, value)    (* else if variable is not present then return the variables as it is *)
									| NONE       => term.v(var))
	  | replace_key_with_value(T:telescope, term.APP(f, li))   = let fun unrolling (t, [])    = []
									   | unrolling (t, y::ys) = (replace_key_with_value(t, y)::unrolling(t, ys))
								     in term.APP(f, unrolling(T, li))
								     end;

	(* if variable is not present in the term, return true, else return false *)
	fun is_not_present(T:telescope, x:V.variable, term.s(f))       = true
	  | is_not_present(T:telescope, x:V.variable, term.v(var))     = (case RedBlackMap.find(T, var) of
									      SOME value => term.occurs(value, x) = false andalso is_not_present(T, x, value)
									    | NONE       => true)
	  | is_not_present(T:telescope, x:V.variable, term.APP(f, li)) = let fun unrolling (t, x, [])       = true
									       | unrolling (t, x, y::ys) = is_not_present(T, x, y) andalso unrolling(t, x, ys)
									 in unrolling(T, x, li)
									 end;
end;

(* unification algorithm *)
functor Unification(structure S:SIG
		    structure V:VAR) = struct
	structure telescope = Telescope(structure S=S structure V=V);
	structure term = telescope.term;
	structure RedBlackMap = telescope.RedBlackMap;
	type telescope = telescope.telescope;

	 (* unify and unifyList mutual recursion *)
	fun unify (T:telescope) (term.s(f1),       term.s(f2))       = NONE
	  | unify (T:telescope) (term.s(f),        term.v(var))      = unify (T) (term.v(var), term.s(f))
	  | unify (T:telescope) (term.s(f1),       term.APP(f2, li)) = NONE
	  | unify (T:telescope) (term.v(var),      t:term.term)      = if telescope.is_not_present(T, var, t) = false then NONE else SOME (RedBlackMap.insert(T, var, telescope.replace_key_with_value(T, t)))
	  | unify (T:telescope) (term.APP(f1, li),  term.s(f2))      = NONE
	  | unify (T:telescope) (term.APP(f, li),  term.v(var))      = unify (T) (term.v(var), term.APP(f, li))
	  | unify (T:telescope) (term.APP(f1, li1),term.APP(f2, li2))= if S.ORD.compare(f1, f2) = EQUAL then unifyList T (li1, li2) else NONE
	and unifyList (T:telescope) ([], [])       = SOME T
	 |  unifyList (T:telescope) (x::xs, y::ys) = (case unify T (x, y) of
							  SOME t => unifyList T (xs, ys)
							| NONE   => NONE)
	 | unifyList (T:telescope) (_, _)          = NONE

end;
