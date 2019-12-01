11.4)

> data BTree a = Leaf a | Fork (BTree a) (BTree a) deriving(Show)
> data Direction = L | R deriving(Show)
> type Path = [Direction]

> foldBTree :: (a -> b) -> (b -> b -> b) -> BTree a -> b
> foldBTree leaf fork (Leaf x) = leaf x
> foldBTree leaf fork (Fork l r) = fork (foldBTree leaf fork l) (foldBTree leaf fork r)

> find :: (Eq a) => a -> BTree a -> Maybe Path
> find x tree  = foldBTree (ec x) helper tree

> ec :: (Eq a) => a -> a -> Maybe Path
> ec x y | x == y = Just []
>        | x /= y = Nothing

> helper :: Maybe Path -> Maybe Path -> Maybe Path
> helper Nothing (Just p) = Just (R : p)
> helper (Just p) Nothing = Just (L : p)
> helper Nothing Nothing = Nothing
> helper _ _ = Nothing 