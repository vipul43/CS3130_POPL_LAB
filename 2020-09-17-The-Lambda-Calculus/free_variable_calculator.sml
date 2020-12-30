type var = string;
datatype expr = variable of var
              | application of expr * expr
              | Abstraction of var  * expr;

fun delete_string_from_list (st:string, [])    = []
  | delete_string_from_list (st:string, x::xs) = if st = x
						 then
						     delete_string_from_list(st, xs)
						 else
						     x::delete_string_from_list(st, xs);
(*
Base Case       : single variable is a free variable
Application case: find free variables in first expression(expression1) and in second expression(expression2) recursively
Abstraction case: find free variables in second expression(expression2) and delete bound variable(var1) from it
*)
fun free (expression:expr) = case expression of
				 variable(var)                         => [var]
			       | application(expression1, expression2) => free(expression1) @ free(expression2)
			       | Abstraction(var1, expression2) => delete_string_from_list(var1, free(expression2));
