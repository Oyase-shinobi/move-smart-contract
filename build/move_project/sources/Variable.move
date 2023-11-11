module my_addrx::Variable
{
    fun local_variables()
    {
        let _b:u8;
        let _c=false;
        let _d=b"hello world";
        let _e:u64=10000;
        let _f:address = @my_addrx;
    }
}