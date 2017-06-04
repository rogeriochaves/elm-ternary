module Doc.TernarySpec exposing (spec)

import Test
import Expect
import Ternary exposing(..)

spec : Test.Test
spec =
    Test.describe "Ternary"
        [
        Test.test ">>> ifThenElse (1 + 1 == 2) \"Math works!\" \"Math is wrong\"" <|
            \() ->
                (ifThenElse (1 + 1 == 2) "Math works!" "Math is wrong")
                |> Expect.equal ("Math works!"),
        Test.test ">>> ifThenElse (String.isEmpty \"pudim\") \"Pudim is empty\" \"Pudim is not empty\"" <|
            \() ->
                (ifThenElse (String.isEmpty "pudim") "Pudim is empty" "Pudim is not empty")
                |> Expect.equal ("Pudim is not empty"),
        Test.test ">>> (1 + 1 == 2) ? \"Math works!\" <| \"Math is wrong ):\"" <|
            \() ->
                ((1 + 1 == 2) ? "Math works!" <| "Math is wrong ):")
                |> Expect.equal ("Math works!"),
        Test.test ">>> String.isEmpty \"pudim\" ? \"Pudim is empty\" <| \"Pudim is not empty\"" <|
            \() ->
                (String.isEmpty "pudim" ? "Pudim is empty" <| "Pudim is not empty")
                |> Expect.equal ("Pudim is not empty"),
        Test.test ">>> (Just \"foo\") ?: \"bar\"" <|
            \() ->
                ((Just "foo") ?: "bar")
                |> Expect.equal ("foo"),
        Test.test ">>> Nothing ?: \"bar\"" <|
            \() ->
                (Nothing ?: "bar")
                |> Expect.equal ("bar")
        ]