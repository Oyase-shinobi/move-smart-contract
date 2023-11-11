/*
std::aptos_hash
keccak256 ,sha2_512 ,sha3_512 ,ripemd160  are available in std::aptos_hash.
*/

module std::Hashing
{
    use std::aptos_hash;
    use std::bcs;
    use std::debug::print;
    
    fun keccak256_hashing_in_move():vector<u8>
    {
        let x:vector<u8> = bcs::to_bytes<u64>(&10);
        let h = aptos_hash::keccak256(x); 
        return h 
    }
     fun sha2_512_hashing_in_move():vector<u8>
    {
        let x:vector<u8> = bcs::to_bytes<u64>(&10);
        let h = aptos_hash::sha2_512(x); 
        return h 
    }
    //  fun sha3_512_hashing_in_move():vector<u8>
    // {
    //     let x:vector<u8> = bcs::to_bytes<u64>(&10);
    //     let h = aptos_hash::sha3_512(x); 
    //     h 
    // }
    //  fun ripemd160_hashing_in_move():vector<u8>
    // {
    //     let x:vector<u8> = bcs::to_bytes<u64>(&10);
    //     let h = aptos_hash::ripemd160(x); 
    //     h 
    // }

    #[test]
    fun testing()
    {
        let tmp=keccak256_hashing_in_move();
        print(&tmp);
        // let tmp=sha2_512_hashing_in_move();
        // print(&tmp);
        // let tmp=sha3_512_hashing_in_move();
        // print(&tmp);
        // let tmp=ripemd160_hashing_in_move();
        // print(&tmp);
    }
}