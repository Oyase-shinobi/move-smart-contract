address my_addrx{
module C{
    public fun A_foo():u8{    //public function
        return 123
    }
}

module D{
    use std::debug::print;
    fun B_foo():u8{
        return my_addrx::C::A_foo()  //Module B can call A_foo() as it is a public function
    }

    #[test]
    fun testing_B()
    {
        let number=B_foo();
        print(&number);
    }
}
}