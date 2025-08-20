import {make_cross, rcross,sail,stack_frac,heart, show, stack, quarter_turn_right} from "rune";

const cost_per_meter = 199.95;

//function declaration
function circumference(radius){
    return 2*math_PI*radius;
}

function cost_of_circular_handrail(r){
    return cost_per_meter * circumference(r);
}

//function call / application
cost_of_circular_handrail(2.1);



function sq(x){
    return x*x;
}

function sum_of_sq(x,y){
    return sq(x)+sq(y);
}
function f(a){
    return sum_of_sq(a+1, a*2);
}

f(5);



function turn_upside_down(rune){
    return quarter_turn_right(quarter_turn_right(rune));
}

function quarter_turn_left(rune){
    return turn_upside_down(quarter_turn_right(rune));
}

show(quarter_turn_left(heart));




//New function: stack_frac
show(stack_frac(1/3, heart, sail));


show(stack_frac(1/3, heart, stack_frac(1/2, heart, heart)));
show(stack_frac(1/4, heart,
    stack_frac(1/3, heart,
    stack_frac(1/2,heart,heart))));



//I wish I have the solution for n-1 hearts stacked.
//stack_frac(1/n,heart,solution)
function stackn(n,rune){
    return n===1 ? rune : stack_frac(1/n,rune,stackn(n-1,rune));
}

show(stackn(5,heart));


show(repeat_patter(4, make_cross,rcross));

function square(x){
    return x*x;
}




//Base case if n === 0, return init

//Say we have the result of computing pat(pat(pat(...))) n-1 times
//pat(solution for n-1)

function repeat_pattern(n, pat, val){
    return n===0 ? val : repeat_pattern(n-1,pat,pat(val));
}
//The above is iterative, NOT RECURSIVE


//THE BELOW IS RECURSIVE
function repeat_pattern(n, pat, val){
    return n===0 ? val : pat(repeat_pattern(n-1,pat,val));
}

repeat_pattern(2,square,2);*/


//n! = n*(n-1)!
//RECURSIVE
function factorial(n){
    return n===0 ? 1 : n * factorial(n-1);
}

factorial(5);


//ITERATIVE
function facIterative(n){
    return iter(1,1,n);
}
//Above is a HELPER FUNCTION for THE RECURSION Below

function iter(product, counter, n){
    return counter > n ? product : iter(counter*product, counter + 1, n);
}
//counter*product gives you the FACTORIAL 
//counter goes from counter === 1 to counter === n-1.
//Remember: n! = n(n-1)(n-2)(n-3)...

facIterative(5);









