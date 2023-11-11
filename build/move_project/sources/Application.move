/*
Copy - value can be copied (or cloned by value).
Drop - value can be dropped by the end of scope.
Key - value can be used as a key for global storage operations.
Store - value can be stored inside global storage.

*/

module my_addrx::Application {
	use std::vector;
        use std::debug;
	use std::string::{String,utf8};

	struct Users has store,drop {
		list_of_users: vector<User>    //storing the list of the users
	}

	struct User has key,store,copy,drop {
		name:String,                   //information required for a typical user
		age:u8
	}

        //creating a user by adding the user to the existing list and returning the user
	public fun create_user(newUser: User,users: &mut Users): User{
		vector::push_back(&mut users.list_of_users,newUser);
		return newUser
	}
	
	#[test]
	fun test_create_friend(){
		let user1 = User {
			name:utf8(b"Tony"),
			age:50,
		};
		
        let users = Users{
			list_of_users: vector::empty<User>()
		};

		let createdUser = create_user(user1,&mut users);
        debug::print(&users);
        assert!(createdUser.name == utf8(b"Tony"),0);
	}
}