(*
Three things are needed here
1. variable
2. application
3. abstraction
*)
type var = string;
datatype expr = variable of var
              | application of expr * expr
	      | Abstraction of var * expr;
(*
Four things are needed here
1. variable
2. application
3. abstraction
** lambda calculus notation λ.x e <=> let notation let x in e <=> sml notation fn x => e **
4. capturing the above notations
*)

datatype l_let = let_variable of var
               | let_application of l_let * l_let
	       | let_Abstraction of var * l_let
	       | let_lambda of var * l_let * l_let;

datatype l_letrec = letrec_variable of var
                  | letrec_application of l_letrec * l_letrec
		  | letrec_Abstraction of var * l_letrec
		  | letrec_lambda of var * l_letrec * l_letrec;
