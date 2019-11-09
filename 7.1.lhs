7.1)

> cp :: [[a]] -> [[a]]
> cp [] = [[]]
> cp (xs:xss) = [ x:ys | x <- xs, ys <- cp xss ]

We write the function to be called in the fold separately:

> f :: [a] -> [[a]] -> [[a]]
> f xs xss = concat [map (x:) xss | x <- xs]

We need to itearet over (xs++[]) otherwise the case [] does not work.

> cp' :: [[a]] -> [[a]]
> cp' xs = foldr f [[]] (xs++[])