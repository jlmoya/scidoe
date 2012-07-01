
// Test script for scidoe_simplelinreg.sci macro of the Scidoe Toolbox.
// Data used are provided in the book:
// "Introduction to probability and statistics for engineers and scientists", Sheldon Ross, Third Edition.
// pages 354-355.


RH = [46 53 29 61 36 39 47 49 52 38 55 32 57 54 44]';
Moisture = [12 15 7 17 10 11 11 12 14 9 16 8 18 14 12]';

computed = scidoe_simplelinreg(RH,Moisture);
expected = [-2.51 0.32]';
assert_checkalmostequal(computed,expected,18*1.e-4);

X = linspace(0,100,100);
Y = computed(1)+computed(2).*X;

scf();
plot(RH,Moisture,"bo",X,Y,"r");
xtitle('Simple linear regression');



