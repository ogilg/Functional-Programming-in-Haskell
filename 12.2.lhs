> fib 0 = 0
> fib 1 = 1
> fib n = fib (n-1) + fib (n-2)

The later calls are getting longer for two reasons: we need to compute every previous fibonacci number, and the integers we are dealing with are gettig exponentially larger.

> two 0 = (0,1)
> two 1 = (1,1)
> two n = (s, f + s) where (f,s) = two (n-1)

The time it takes to compute fib n is proportional to n because we complete a fixed number of operations at each step.

> roughly :: Integer -> String
> roughly n = x : 'e' : show (length xs) where (x:xs) = show n

fib 10 000 is roughly 3*10^2089


Using the matrix type from question 8.2

> type Matrix a = [[a]]
> cols :: [[a]] -> [[a]]
> cols s = [[(s!!n)!!k | n <- [0..height]]| k <- [0..width]]
>            where height = (length s)-1
>                  width = (length (s!!1))-1

> dot :: (Num a) => [a] -> [a] -> a
> dot xs ys = sum $ zipWith (*) xs ys

> mul :: (Num a) => Matrix a -> Matrix a -> Matrix a
> mul s t = [map (dot row) (cols t) | row <- s]

and the definition of power in the lecture notes
:

> power (*) y x n -- x^n*y
> 	| n == 0 = y
> 	| even n = power (*) y (x*x) (n `div` 2)
> 	| odd n = power (*) (x*y) x (n-1)


We run tis in GHCI:
roughly ((nb !! 1) !! 0) where nb = power mul 1 [[0,1],[1,1]] 1000000 

We get that the millionth fibonacci number is roughly 10^208987