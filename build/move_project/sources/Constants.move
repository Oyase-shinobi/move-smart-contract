module my_addrx::Constants
{
    use std::debug::print;

    //Some Examples
    const X:u64=10;
    const Y:address=@my_addrx;
    const Z:bool=false;

    fun constants()
    {
        print(&X);
        print(&Y);
        print(&Z);
        
    }

    #[test]
    fun testing()
    {
        constants();
    }
}