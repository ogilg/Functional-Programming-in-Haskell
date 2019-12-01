11.3)

> data Set a = Empty | Singleton a | Union (Set a) (Set a) deriving(Show)

> foldSet :: (b -> b -> b) -> b -> (a -> b) -> Set a -> b
> foldSet f null s Empty = null
> foldSet f null s (Singleton a) = s a
> foldSet f null s (Union xs ys) = f (foldSet f null s xs) (foldSet f null s ys)


> isIn :: (Eq a) => a -> Set a -> Bool
> isIn x set = foldSet (||) False (==x) set

> subset :: (Eq a) => Set a -> Set a -> Bool
> subset sub bigset = foldSet (&&) True (flip isIn bigset) sub

> instance (Eq a) => (Eq (Set a)) where
>      set1 == set2 = (subset set1 set2) && (subset set2 set1)