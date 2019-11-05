6.5)

> unfold2 :: (a-> Bool ) -> (a -> b) -> (a -> a) -> a -> [b]
> unfold2 null head tail x | null x = []
>                          | otherwise = head x : unfold2 null head tail (tail x)