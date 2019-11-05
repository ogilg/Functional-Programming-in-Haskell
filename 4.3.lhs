Question 4.3
We define the typeclass Order as in the question, choosing different names than the ones in the prelude.

>class (Eq a) => (Order a) where
>    less :: a -> a -> Bool
>    lesseq :: a -> a -> Bool
>    greater :: a -> a -> Bool
>    greatereq :: a -> a -> Bool
>    less x y = not (greatereq x y)
>    greater x y = not (lesseq x y)
>    greatereq x y = x == y || greater x y

Our first instance declaration specifies how to order integers using the compare function

>instance Order Integer where
>    lesseq x y = x==y || x`compare`y == LT 
    
Our second instance declaration extends this to lists of integers, the second and third lines insure that lists of different lengths can also be ordered.
	
>instance (Order a) => (Order [a]) where
>    lesseq [] [] = True
>    lesseq x [] = False
>    lesseq [] x = True
>    lesseq (x:xs) (y:ys) = less x y || ( x==y && lesseq xs ys)