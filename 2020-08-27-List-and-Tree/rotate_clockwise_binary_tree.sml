(*
 included the datatype of 'a tree just for reference
*)
datatype 'a tree = Null | Node of ('a tree * 'a * 'a tree);

(*
 rotateCW:		    ('a tree -> 'a tree)
 Null:		            'a tree
 Node(tree1, data1, tree2): 'a tree
 three cases
 i)   tree is empty tree then return the same empty tree
 ii)  if root node of the tree has no left subtree => this case is pattern matched with Node(Null, data, righttree) in this case return same tree back (identity operation)
 iii) tree is proper, then apply clockwise rotation operation
*)
fun rotateCW Null = Null
  | rotateCW (Node(Null, data, righttree)) = Node(Null, data, righttree)
  | rotateCW (Node(Node(tree1, data1, tree2), data2, tree3)) = Node(tree1, data1, Node(tree2, data2, tree3));
