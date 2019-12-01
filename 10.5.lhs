10.5)

> data Liste a = Snoc (Liste a) a | Lin deriving(Show, Eq)

> unfolde :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> Liste a
> unfolde n h t xs | n xs = Lin
>                  | otherwise = Snoc (unfolde n h t (t xs)) (h xs)

> decon2 :: Liste a -> Liste a
> decon2 (Snoc xs x) = xs

> decon1 :: Liste a -> a
> decon1 (Snoc xs x) = x

We see that 

unfolde (==Lin) decon1 decon2 = id

> liste'' :: (Eq a) => [a] -> Liste a
> liste'' = unfolde (==[]) last init



> unfold :: (a-> Bool ) -> (a -> b) -> (a -> a) -> a -> [b]
> unfold null head tail x | null x = []
>                         | otherwise = head x : unfold null head tail (tail x)

We define the relevant functions for the type Liste and them call them in the unfold:

> heade :: Liste a -> a
> heade (Snoc Lin x) = x
> heade (Snoc xs x) = heade xs

> taile :: Liste a -> Liste a
> taile (Snoc Lin x) = Lin
> taile (Snoc xs x) = Snoc (taile xs) x


> list'' :: (Eq a) => Liste a -> [a]
> list'' = unfold (== Lin) heade taile

	