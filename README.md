# Elm Ternary

This simple provides infix functions for shorter if/then/else
conditionals, known as ternary, and a "null" coalescing operator for Maybes.

```elm
import Ternary exposing ((?), (?:))

exampleTernary =
  (1 + 1 == 2) ? "Math works!" <| "Math is wrong ):"

exampleNullCoalescing =
  (Just "foo") ?: "bar"
```
