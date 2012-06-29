//test function for doetbx_ff2n()


//Test doetbx_ff2n()
n=3;
computed = doetbx_ff2n(n);
expected = [0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
assert_checkequal(computed,expected);

