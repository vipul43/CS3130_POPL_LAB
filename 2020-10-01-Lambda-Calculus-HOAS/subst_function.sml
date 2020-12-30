(* normal representation of lambda calculus *)
datatype lam = V of string
             | A of lam * lam
             | L of string * lam;

(* HOAS representation of lambda calculus *)
datatype hlam = HV of string
              | HA of hlam * hlam
              | HL of hlam -> hlam;

(* ANSWER *)
fun subst (x, N) (HV(y))              = if (y = x) then N else HV(y)
  | subst (x, N) (HA(expr1, expr2))   = HA((subst (x, N) expr1), (subst (x, N) expr2))
  | subst (x, N) (HL(func))           = let fun helper z = subst (x, N) (func z)
                                        in
                                            HL(helper)
		                        end;
