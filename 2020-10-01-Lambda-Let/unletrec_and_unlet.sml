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
(*
converting between the languages using same concept as described in datatypes
- unletrec converts expression in letrec language to let language
  1. handle variable in letrec language to variable in let language
  2. handle application in letrec language to application in let language
  3. handle abstraction in letrec language to abstraction in let language
  4. handle complete expression in letrec language to complete expression in let language
- unlet converts expression in let language to lamda calculus language
  1. handle variable in let language to variable in lambda calculus
  2. handle application in let language to application in lambda calculus
  3. handle abstraction in let language to abstraction in lambda calculus
  4. handle complete expression in let language to complete expression in lambda calculus
*)

fun unletrec (letrec_variable(v))               = let_variable(v)
  | unletrec (letrec_application(expr1, expr2)) = let_application(unletrec(expr1), unletrec(expr2))
  | unletrec (letrec_Abstraction(v, expr1))     = let_Abstraction(v, unletrec(expr1))
  | unletrec (letrec_lambda(v, expr1, expr2))   = let_application(let_Abstraction(v, unletrec(expr2)), unletrec(expr1));

fun unlet (let_variable(v))               = variable(v)
  | unlet (let_application(expr1, expr2)) = application(unlet(expr1), unlet(expr2))
  | unlet (let_Abstraction(v, expr1))     = Abstraction(v, unlet(expr1))
  | unlet (let_lambda(v, expr1, expr2))   = application(Abstraction(v, unlet(expr2)), unlet(expr1));
