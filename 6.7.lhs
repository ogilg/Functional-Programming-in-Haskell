6.7)

> data Tree a = Fork (Tree a) a (Tree a) | Empty

> insert :: (Ord a) => a -> (Tree [a]) -> (Tree [a])
> insert z Empty = Fork Empty [z] Empty
> insert z (Fork xt zs yt) 
>                  | z == zs !! 1 = Fork xt (z:zs) yt
>                  | z < zs !! 1 = Fork (insert z xt) zs yt
>                  | otherwise   = Fork xt zs (insert z yt)

> flatten :: Tree [a] -> [a]
> flatten (Fork xt zs yt) = (flatten xt) ++ zs ++ (flatten yt)

> bsort :: (Ord a) => [a] -> [a]
> bsort = flatten . foldr insert Empty