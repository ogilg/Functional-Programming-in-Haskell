11.1)

> foldBool :: (Bool->a) -> Bool -> a
> foldBool f bool = f $ not bool

> data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving(Eq,Show)
>

> foldday:: (Day -> a -> a) -> a -> Day -> a
> foldday f n day 
>		|day == Monday = f day (foldday f n Sunday)
>		|day == Tuesday = f day (foldday f n Monday)
>		|day == Wednesday = f day (foldday f n Tuesday)
>		|day == Thursday = f day (foldday f n Wednesday)
>		|day == Friday = f day (foldday f n Thursday)
>		|day == Saturday = f day (foldday f n Friday)
>		|day == Sunday = f Sunday n