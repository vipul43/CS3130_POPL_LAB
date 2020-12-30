(*
 two cases of 'a tree
 i)  Null tree which is like empty tree
 ii) Node('a tree, 'a, 'a tree) is like a node having 'a type data and 'a tree type left subtree and 'a tree type right subtree
*)

datatype 'a tree = Null | Node of ('a tree * 'a * 'a tree);
