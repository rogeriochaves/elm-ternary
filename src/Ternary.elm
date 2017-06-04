module Ternary exposing ((?), (?:), ifThenElse)

{-| This simple package provides infix functions for shorter if/then/else
conditionals, known as ternary, and a "null" coalescing operator for Maybes

@docs ifThenElse, (?), (?:)

-}


{-| A shorter version for Elm's if special syntax, like clojure.core `if` function

Reference: [<https://clojuredocs.org/clojure.core/if>](https://clojuredocs.org/clojure.core/if)

    >>> ifThenElse (1 + 1 == 2) "Math works!" "Math is wrong"
    "Math works!"

    >>> ifThenElse (String.isEmpty "pudim") "Pudim is empty" "Pudim is not empty"
    "Pudim is not empty"

-}
ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


{-| A ternary operator for Elm's if, the most common syntax would be
`condition ? trueCase : falseCase`, but this is not possible in Elm because `:`
is special. So we can use right pipe instead.

Reference: [<https://en.wikipedia.org/wiki/%3F>](https://en.wikipedia.org/wiki/%3F)

    >>> (1 + 1 == 2) ? "Math works!" <| "Math is wrong ):"
    "Math works!"

    >>> String.isEmpty "pudim" ? "Pudim is empty" <| "Pudim is not empty"
    "Pudim is not empty"

-}
(?) : Bool -> a -> a -> a
(?) =
    ifThenElse


{-| A null coalescing operator, but since Elm doesn't have nulls, it works on
Maybes. Is it basically a flipped, infix version of `withDefault`.
It is also called "the Elvis operator".

References:
[<https://en.wikipedia.org/wiki/Null_coalescing_operator>](https://en.wikipedia.org/wiki/Null_coalescing_operator)
[<https://en.wikipedia.org/wiki/Elvis_operator>](https://en.wikipedia.org/wiki/Elvis_operator)

    >>> Just "foo" ?: "bar"
    "foo"

    >>> Nothing ?: "bar"
    "bar"

-}
(?:) : Maybe a -> a -> a
(?:) =
    flip Maybe.withDefault
