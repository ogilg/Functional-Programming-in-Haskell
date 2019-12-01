9.1)

> data Nat = Zero | Succ Nat deriving(Show)

> int :: Nat -> Int
> int Zero = 0
> int (Succ n) = (int n) +1

> nat:: Int -> Nat
> nat 0 = Zero
> nat n = Succ (nat(n-1))

> add :: Nat -> Nat -> Nat
> add n Zero = n
> add n (Succ m) = Succ(add n m)

> mul :: Nat -> Nat -> Nat
> mul _ Zero = Zero
> mul n (Succ Zero) = n
> mul n (Succ m) = add n (mul n m)

> pow :: Nat -> Nat -> Nat
> pow _ Zero = Succ Zero
> pow n (Succ m) = mul n (pow n m)

> tet :: Nat -> Nat -> Nat
> tet n (Succ Zero) = n
> tet n (Succ m) = pow n (tet n m)

