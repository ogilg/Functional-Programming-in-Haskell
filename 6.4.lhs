6.4)

We first create a function that splits the list so that we can iterate over it while conserving it i its entirety.

> listSplits :: [a] -> [([a],[a])]
> listSplits xs = [splitAt n xs| n<-[0..length xs]]

We now write include' using foldr, creating the place function:

> place :: a -> ([a],[a]) -> [[a]] -> [[a]]
> place x (ns, ms) yss = (ns ++ [x] ++ ms) : yss

> include'' :: (Eq a) => a -> [a] -> [[a]]
> include'' x ys = foldr (place x) [] (listSplits ys)

We similarly write permutations':

> helper :: (Eq a) => a -> [[a]] -> [[a]]
> helper x ys = concat $ map (include'' x) ys

> permutations' :: (Eq a) => [a] -> [[a]]
> permutations' xs = foldr helper [[]] xs
