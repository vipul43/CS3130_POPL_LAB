(*
 included the datatype of 'a tree just for reference
*)
datatype 'a tree = Null | Node of ('a tree * 'a * 'a tree);

(*
 treemap:		   ('a -> 'b) -> 'a tree -> 'b tree
 f:           	     	   ('a -> 'b)
 Null:                     'a tree
 Node(tree1, data, tree2): 'a tree

 treemap applied to a node is same as applying treemap to its leftsubtree and right subtree and applying function to the data of the node
*)

fun treemap f Null = Null
  | treemap f (Node (tree1, data, tree2)) = Node (treemap f (tree1), f (data), treemap f (tree2));
