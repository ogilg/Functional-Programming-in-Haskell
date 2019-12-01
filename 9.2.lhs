9.2)

> data Nat = Zero | Succ Nat deriving(Show)

foldNat is characterised by the fact that the function it takes (f) only takes one argument. This is because Nat only has two constructors (Succ and Zero).

> foldNat :: (a -> a) -> a -> Nat -> a
> foldNat f n Zero = n
> foldNat f n (Succ nat) = f (foldNat f n nat)

> unfoldNat :: (a -> Bool) -> (Nat -> Nat) -> (a -> a) -> a -> Nat
> unfoldNat null head tail m |null m = Zero
>                            |otherwise = head (unfoldNat null head tail (tail m))

The deconstructors of Nat are:

> prec :: Nat -> Nat
> prec (Succ n) = n

> isZero :: Nat -> Bool
> isZero Zero = True
> isZero _ = False

> int :: Nat -> Int
> int = foldNat (+1) 0

> nat :: Int -> Nat
> nat = unfoldNat (==0) Succ (+(-1)) 

> add :: Nat -> Nat -> Nat
> add n m = foldNat Succ n m

> mul :: Nat -> Nat -> Nat
> mul n m = foldNat (add n) Zero m

> pow :: Nat -> Nat -> Nat
> pow n m = foldNat (mul n) (Succ Zero) m

> tet :: Nat -> Nat -> Nat
> tet n m = foldNat (pow n) n m

