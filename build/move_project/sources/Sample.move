module my_addrx::Sample
{
    use std::debug;

    fun sample_function()
    {
        debug::print(&1);
    }

    #[test]
    fun testing()
    {
        sample_function();
    }
}