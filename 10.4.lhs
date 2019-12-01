10.4)

> data Liste a = Snoc (Liste a) a | Lin deriving(Show)

Recursive definition of cat:

> cat :: Liste a -> Liste a -> Liste a
> cat xs Lin = xs
> cat xs (Snoc ys y) = Snoc (cat xs ys) y 

folde on liste's

> folde :: (a -> b -> a) -> a -> Liste b -> a
> folde f n Lin = n
> folde f n (Snoc xs x) = f (folde f n xs) x

> cat' :: Liste a -> Liste a -> Liste a
> cat' xs ys = folde Snoc xs ys 

> list :: Liste a -> [a]
> list = folde (\x -> \y -> (x++[y])) []

> liste :: [a] -> Liste a
> liste = foldr (flip Snoc) Lin . reverse 


When applied to an infinite list, liste returns bottom as it is uncapable of getting to the last element of the list, and liste evaluates a list from its last element to the first.

The infinite objects of type Liste a are lists whose beginning is infinite
This is the case where we have an infinite amount of Snoc's:

Equivalent definitions:


> liste' :: [a] -> Liste a
> liste' = foldl Snoc Lin 


We implement a loop on liste's:

> loope :: (b -> a -> a) -> a -> Liste b -> a
> loope f n Lin = n	
> loope f n (Snoc xs x) = (loope f (f x n) xs)

> list' :: Liste a -> [a]
> list' = loope (:) []



