7.2)
We just add one pattern-matching clause:

> cols :: [[a]] -> [[a]]
> cols [] = [[]]
> cols [xs] = [ [x] | x <- xs ]
> cols (xs:xss) = zipWith (:) xs (cols xss)

We redefine zipWith (:) to work in our fold

> altZip :: [a] -> [[a]] -> [[a]]
> altZip [] [[]] = []
> altZip [] _ = []
> altZip xs [[]] = [[x] | x <- xs]
> altZip (x:xs) (ys:yss) = (x:ys) : (altZip xs yss)

> cols' :: [[a]] -> [[a]]
> cols' = foldr altZip [[]]