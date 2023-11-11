module my_addrx::UnderstandingTimestamp{
  
    use std::timestamp; 
     use std::string::utf8;
    
    public entry fun time()
    {
        let t1=timestamp::now_microseconds();
        std::debug::print(&utf8(b"time testing1"));
        std::debug::print(&t1);
        
        let t2=timestamp::now_seconds();
        std::debug::print(&utf8(b"time testing2"));
        std::debug::print(&t2);
    }
 
 
     #[test(framework = @0x1)]
    fun testing_time(framework: signer)
    {
        // set up global time for testing purpose
        timestamp::set_time_has_started_for_testing(&framework);  
        // std::debug::print(&utf8(b"time testing"));
        time(); 
    }   
}