Definition of zipWith using zip:

>zipWith'' :: (a -> b -> c) -> [a] -> [b] -> [c]
>zipWith'' f xs ys = map (uncurry f)$ zip xs ys

Recursive definition of zipWith:

>zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
>zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
>zipWith' f _  _ = []

definition of zip using zipWith'

>zip' :: [a] -> [b] -> [(a,b)]
>zip' = zipWith' (curry id)
