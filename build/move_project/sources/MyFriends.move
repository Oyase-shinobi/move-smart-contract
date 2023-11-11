module my_addrx::MyFriends
{
    use std::vector;
    use aptos_std::object::{Self,Object}; 
    use std::signer;
    use aptos_framework::account;

    struct MyFriends has key
    {
        friends: vector<vector<u8>>,
    }

    public  fun create_friends(caller: &signer, list:vector<vector<u8>> ) : Object<MyFriends>
    {
        let myfriend_constructor_ref = object::create_object_from_account(caller); 
        let myfriend_signer = object::generate_signer(&myfriend_constructor_ref);   
        move_to(&myfriend_signer, MyFriends{ friends:list });  
        let obj = object::object_from_constructor_ref<MyFriends>(&myfriend_constructor_ref);
        return obj
    }

    public  fun transferring_of_ownership(from: &signer,to: address,obj: Object<MyFriends>) : address
    {
        object::transfer(from,obj,to); //transferring ownership of the object
        let new_owner_of_the_object = object::owner(obj); // ownership is tracked on the object itself
        return new_owner_of_the_object
    }

    #[test(owner = @0x123)]
    public entry fun test_ownership(owner: signer)  
    {
        account::create_account_for_test(signer::address_of(&owner));
        
        let list = vector::empty<vector<u8>>();
        vector::push_back(&mut list, b"John");
        vector::push_back(&mut list, b"Harry");
        vector::push_back(&mut list, b"Gwen");   
        let obj = create_friends(&owner,list);
        
        assert!(signer::address_of(&owner) == @0x123,1);
         
        //transferring the ownership of the object from the owner account to 0x345 account
        
        let new_owner_address = transferring_of_ownership(&owner,@0x345,obj);
        assert!(signer::address_of(&owner) == @0x123,0);
         
        assert!(new_owner_address == @0x345,1);
    }
    
}