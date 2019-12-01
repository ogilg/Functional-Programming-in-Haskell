

> LANGUAGE BangPatterns 

> loop' s n [] = n
> loop' s (!n) (x:xs) = loop' s (s n x) xs

> loop s n [] = n
> loop s (n) (x:xs) = loop s (s n x) xs

> test f = f (const error) () ["strict","lazy"]