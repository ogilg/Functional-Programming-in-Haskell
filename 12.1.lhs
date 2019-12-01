> type Queue a = [a]

> empty :: Queue a
> empty = []

> isEmpty :: Queue a -> Bool
> isEmpty [] = True
> isEmpty _ = False

> add :: a -> Queue a -> Queue a 
> add el [] = [el]
> add el (x:xs) = x: (add el xs)

> get :: Queue a -> (a,Queue a)
> get (x:q) = (x,q)

isEmpty : O(1) only one check
add     : O(n) where n is the length of the list because we go all the way to the end of the list
get     : O(1) the length of the list does not affect the number of steps

In the new type, the front is first in first out and the back is last in last out.

> type Q a = (Queue a,[a])

> empty' :: Q a
> empty' = ([],[])

> isEmpty' :: Q a -> Bool
> isEmpty' ([],[]) = True
> isEmpty' _ = False

> add' :: a -> Q a -> Q a
> add' el (xs,ys) = (xs, el:ys)

> get' :: Q a -> (a,Q a)
> get' (x:xs,ys) = (x,(xs,ys))

We may want to add a function that balances the Queue

> balance :: Q a -> Q a
> balance ([],xs) = (reverse xs, [])
> balance q = q

