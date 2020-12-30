signature COUNTER = sig
    val incr : unit -> unit
    val decrement : unit ->unit
    val get : unit -> int
end

functor MkCounter () : COUNTER
    = struct
    val count        = ref 0
    fun incr ()      = count := !count +1
    fun decrement () = count := !count -1
    fun get ()       = !count
end
