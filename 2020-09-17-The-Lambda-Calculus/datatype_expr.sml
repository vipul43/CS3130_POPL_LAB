(*
Three things are needed here
1. variable
2. application
3. abstraction
*)

type var = string;
datatype expr = variable of var
              | application of expr * expr
              | Abstraction of var  * expr;
