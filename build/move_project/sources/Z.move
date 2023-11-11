address my_addrx{
module X{
    friend my_addrx::Y; //declaring friends of module Y

    public(friend) fun X_foo():u8{
        return 123
    }   
}

module Y{
    fun Y_foo():u8{
        return my_addrx::X::X_foo() //Module Y can call X_foo() as Y is in friend list of X
    }
}

module Z{
    // fun Z_foo():u8{
    //     return my_addrx::X::X_foo() //ERROR - as module Z is not in friend list of X
    // }   
}
}

module my_addrx::E{
    use std::debug::print;
    use std::string::utf8;
    public entry fun foo(){   //entry function can be private,public or public(friend)
        print(&utf8(b"This is an entry function"));
    }
    #[test]
    fun testing()
    {
        foo();
    }
}