# Unification algorithm.

Deadline: 29 Oct, 2020

The unification algorithm is a recursive algorithm on the structure of
the terms. Recall that a *term* over the signature `S` with variable
set `V`, denoted by `Term(S,V)` is defined inductively as follows.

   - Any constant of `c âˆˆ S` is a term
   - Any variable `x âˆˆ S` is a term
   - If `tâ‚,...,tâ‚™` are terms and `f âˆˆ S` is a functional symbol of arity `n` then
   - f (tâ‚,....,tâ‚™) is also a term.


The essence of unification of two terms `s` and `t` is the following.

1. Two constants may be unified if they are the same constant.

2. If one of the terms is a variable `x` and the other is the term `t`, then
   one gets a variable assignment then and there.

3. Unification of terms `f(sâ‚,....,sâ‚™)` and `g(tâ‚,...,tâ‚˜)` is possible
   if and only if the function symbol `f` and `g` are the same (thus
   `n = m`) and sáµ¢ unifies with táµ¢ 's respectively. The term `f(sâ‚,...,sâ‚™)`
   unifies with `f(tâ‚,...,tâ‚™)` under the telescope Ïƒ if and only if each
   sáµ¢ unifies with táµ¢ under Ïƒ.





However, getting this in practice requires writing the mutually
recursive generalisations.

1. `unify : telescope -> (term, term) -> option telescope`.  Given a
   telescope `Ïƒ` and terms `s` and `t`, it computes an extension `Ïƒâ‚€`
   of `Ïƒ` (if possible) that unifies `s[Ïƒ]` and `t[Ïƒ]`. Recall our
   notation that `s[Ïƒ]` is the term obtained by substituting all the
   variable assignments of `Ïƒ` in `s`.

2. `unifyList : telescope -> (term, term) list -> option
   telescope`. This function simultaneously unifies each of the terms
   under the given telescope.