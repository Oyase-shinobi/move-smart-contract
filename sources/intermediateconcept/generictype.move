module my_addrx::Generics
{
    //a generic identity function that takes a value of any type and returns that value unchanged
    fun example<T>(num: T): T {
        num
    }

    #[test]
    fun testing()
    {
        let x:u64 = example<u64>(8);
        let y:bool = example<bool>(true);

        assert!(x==8,1);
        assert!(y==true,1);

    }

}