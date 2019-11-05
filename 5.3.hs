evens :: [a] -> [a]
evens [] = []
evens [x] = [x]
evens (y:z:xs) = y:evens xs

odds :: [a] -> [a]
odds [] = []
odds [x] = []
odds (y:z:xs) = z:odds xs

alts :: [a] -> ([a],[a])
alts [] = ([],[])
alts [x] = ([x],[])
alts (y:z:xs) = (y:ys,z:zs) where (ys,zs) = alts xs