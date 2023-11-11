/*
Functions in move can be declared as:
private - By default the functions in move are private(that means they can only be called within the same module and cannot be access outside the module by other modules and scripts.
public - A public function can be called by any function in any module or script.
public(friend) - A public(friend) function can be called by any function in the same module and by the function of the module which are explicitly defined in the friend list.
entry - Entry function are the function where move program starts its execution. They can be combined with public and public(friend) modifier.

*/
address my_addrx{
module A{
    fun A_foo():u8{    //private function
        return 123
    }
}

module B{
    // use std::debug;
    // fun B_foo():u8{
    //     return my_addrx::A::A_foo()  //ERROR - as A_foo() is a private function
    // }

    #[test]
    fun testing_B()
    {
        // let number=B_foo();
        // print(&number);
    }
}
}

