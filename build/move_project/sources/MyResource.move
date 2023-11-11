/*
The std::signer standard library module provides two utility functions over signer values:
signer::address_of(&signer): address - Return the address wrapped by this &signer.
signer::borrow_address(&signer): &address - Return a reference to the address wrapped by this &signer.
*/

module my_addrx::MyResource
{
    use std::signer; 
    
    struct MyResource has key
    {
        value:u64
    }

    public entry fun increase_value_by_one(account: &signer) acquires MyResource {
        
        let signer_address = signer::address_of(account); 
        
        let myresource = borrow_global_mut<MyResource>(signer_address);
        myresource.value=myresource.value+1;
    }
}
