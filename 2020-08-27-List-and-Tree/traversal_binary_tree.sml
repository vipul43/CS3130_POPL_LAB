(*
 included the datatype of 'a tree just for reference
*)
datatype 'a tree = Null | Node of ('a tree * 'a * 'a tree);

(*
 inorder:			('a tree -> 'a list)
 Null:    			'a tree
 Node(leftree, data, righttree):'a tree
applying inorder to lefttree and then appending data to list and then applying inorder to righttree*)

fun inorder Null = []
  | inorder (Node (lefttree, data, righttree)) = inorder lefttree @ [data] @ inorder righttree;

(*
 preorder:			('a tree -> 'a list)
 Null:    			'a tree
 Node(leftree, data, righttree):'a tree
appending data to list and then applying preorder to lefttree and then applying preorder to righttree*)

fun preorder Null = []
  | preorder (Node (lefttree, data, righttree)) = [data] @ preorder lefttree @ preorder righttree;
(*
 preorder:			('a tree -> 'a list)
 Null:    			'a tree
 Node(leftree, data, righttree):'a tree
applying postorder to lefttree and then applying postorder to righttree and then appending data*)

fun postorder Null = []
  | postorder (Node (lefttree, data, righttree)) = postorder lefttree @ postorder righttree @ [data];
