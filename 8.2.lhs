8.2)

> type Matrix a = [[a]]

> scale :: (Num a) => a -> Matrix a -> Matrix a
> scale w = map (map (*w))

> dot :: (Num a) => [a] -> [a] -> a
> dot xs ys = sum $ zipWith (*) xs ys

> add :: (Num a) => Matrix a -> Matrix a -> Matrix a
> add = zipWith (zipWith (+))

We redefine cols

> cols :: [[a]] -> [[a]]
> cols s = [[(s!!n)!!k | n <- [0..height]]| k <- [0..width]]
>            where height = (length s)-1
>                  width = (length (s!!1))-1
 
> mul :: (Num a) => Matrix a -> Matrix a -> Matrix a
> mul s t = [map (dot row) (cols t) | row <- s]


We use the definition of rjustify'

> rjustify' :: Int -> String -> String
> rjustify' n xs | n>=length xs      = concat [take (n-length xs) (repeat ' '),xs]
>                | otherwise = take n xs

We define table as a composition of three functions

> table :: (Show a) => Matrix a -> String
> table = display . align . toStrings 

toStrings converts the integers in the matrix to strings

> toStrings :: (Show a) => Matrix a -> [[String]]
> toStrings = map (map show)

align adds the right amount of spaces to each string for them to be aligned

> align :: [[String]] -> [[String]]
> align m = cols [map (rjustify' (maximum (map length r))) r | r <- cols m]

display takes the modified list and 

> display :: [[String]] -> String
> display m = unlines (map unwords m) ++ " \n"







