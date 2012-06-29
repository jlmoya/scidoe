//Test function of doetbx_fullfact.sci

levels = [2 3];
computed = doetbx_fullfact(levels);
expected = [1 1;1 2;1 3;2 1;2 2;2 3];
assert_checkequal(computed,expected);
