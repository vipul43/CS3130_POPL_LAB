(* ORD_KEY signature to make comparisons between mentioned datatypes *)
datatype comp = smaller | equal | greater;
signature ORD_KEY = sig
    type ord_key;
    val compare : ord_key * ord_key -> comp;
end;

(* defining SML signature to capture the signature set of variables only *)
signature VAR = sig
    type variable;                                         (* type to capture variables itself *)
    structure ORD : ORD_KEY where type ord_key = variable; (* structure ORD to compare variables *)
end;
