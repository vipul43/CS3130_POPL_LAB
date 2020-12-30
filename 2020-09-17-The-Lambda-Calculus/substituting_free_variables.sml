type var = string;
datatype expr = variable of var
              | application of expr * expr
              | Abstraction of var  * expr;

fun subst (vr:var, e1:expr) (e2:expr) = case e2 of
					    application(expression1, expression2) => application(subst (vr, e1) expression1, subst (vr, e1) (expression2))
					  | Abstraction(var1, expression2)        => if var1 = vr
										     then
											 Abstraction (var1, expression2)
										     else
											 Abstraction (var1, subst (vr, e1) expression2)
					  | variable(x)                           => if x = vr
										     then
											 e1
										     else
											 e2;
