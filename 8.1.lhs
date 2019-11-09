8.1)

> rjustify :: Int -> String -> String
> rjustify 0 xs = xs 
> rjustify n xs =  concat [take (n-length xs) (repeat ' '),xs]

> ljustify :: Int -> String -> String
> ljustify n xs = concat[xs, take (n-length xs) (repeat ' ')]

When the length of the string exceeds the specified length, the whoe string is returned. We could avoid this:

> ljustify' :: Int -> String -> String
> ljustify' n [] = take n (repeat ' ')
> ljustify' 0 xs = []
> ljustify' n (x:xs) = x: (ljustify' (n-1) xs)

> rjustify' :: Int -> String -> String
> rjustify' n xs | n>=length xs      = concat [take (n-length xs) (repeat ' '),xs]
>                | otherwise = take n xs