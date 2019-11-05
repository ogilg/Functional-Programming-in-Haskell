6.3)

We first define the function unfold


> unfold' :: (a -> Bool ) -> (a -> b) -> (a -> a) -> a -> [b]
> unfold' null head tail = map head . takeWhile (not.null) . iterate tail

We now create the three functions that will serve as parameters to unfold.
The first one creates the actual entries to the list of the form (x, as++bs):

> createEntry :: ([a],[a]) -> (a,[a])
> createEntry (xs,(b:bs)) = (b,xs++bs)

The second function determines when we are done:

> done :: (Eq a) => ([a],[a]) -> Bool
> done (xs,bs) = bs == []

The third function is used as the iterative step to go through the list:

> step :: ([a],[a]) -> ([a],[a])
> step (xs,(b:bs)) = (xs++[b],bs)

This last function just gets the input into the appropriate form for us to iterate on:

> listInitialiser :: [a] -> ([a],[a])
> listInitialiser xs = ([],xs)


> splits :: (Eq a) => [a] -> [(a,[a])]
> splits = unfold' done createEntry step . listInitialiser