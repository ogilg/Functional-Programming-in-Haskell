>import Data.Char
>song :: Integer -> String

We define three functions write and men to tailor the words to the value of n:

>write :: Integer -> String
>write 1 = "one"
>write 2 = "two"
>write 3 = "three"
>write 4 = "four"
>write 5 = "five"
>write 6 = "six"
>write 7 = "seven"
>write 8 = "eight"
>write 9 = "nine"
>write 10 = "ten"

>men :: Integer -> String
>men n = if n==1 then "man" else "men"

This last function capitalises only the first letter of a string

>capitalise :: String -> String
>capitalise (head:tail) = toUpper head : map toLower tail

We now define song using a where statement, and specifying each line using the building blocks we previously defined.

>song 0 = ""
>song n = song (n-1) ++ "\n" ++ verse n
>verse n = line1 n ++ line ++ line3 n ++ line where 
>    line = "Went to mow a meadow " ++ "\n"
>    line1 n = capitalise $ write n ++ " " ++ men n ++ " " ++ "went to mow" ++ "\n"
>    line3 n = capitalise $ concat [write x ++" " ++ men x ++ ", "| x <- reverse[1..n]] ++ "and his dog" ++ "\n"



