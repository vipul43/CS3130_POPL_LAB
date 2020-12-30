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
