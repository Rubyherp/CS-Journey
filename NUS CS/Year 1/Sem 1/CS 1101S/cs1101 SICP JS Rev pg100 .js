// 31 AUG 2025

function square(x){
    return x*x;
}
function sum_of_square(a, b){
    return square(a) + square(b);
}


const square_lambda = x => x*x;
const sum_of_square_lambda = (a,b) => square_lambda(a) + square_lambda(b);

//sum_of_square(2,4);
//sum_of_square_lambda(2,4);

function f(a){
    return sum_of_square(a+1, a*2);
}
//or
const g = a => sum_of_square(a+1, a*2);

//g(5);


// Return boolean with lambda
const greater_or_equal = (x,y) => x === y || x > y;

//greater_or_equal(2,3);


const x = (5+4+(2-(3-6+(4/5))))/(3*(6-2)*(2-7));

x;


function sum_three_square(a, b, c){
    return (a>=b && b>=c) || (b>=a && b>=c) 
        ? square(a) + square(b)
        : (c>=b && b>=a) || (b>=c && c>=a)
        ? square(c) + square(b)
        : (a>=c && c>=b) || (c>=a && a>=b)
        ? square(a) + square(c)
        : 0;
}

sum_three_square(10,6,4);


function fibonacii(x){
    return x === 0 
    ? 0
    : x === 1
    ? 1
    : fibonacii(x-1) + fibonacii(x-2);
}


const fib_lambda = x => {
    if (x===0){
        return 0;
    }
    if (x===1){
        return 1;
    }
    else {
        return fib_lambda(x-1) + fib_lambda(x-2);
    }
} ;

//fib_lambda(5);
//fibonacii(5);


((x, y, z) => x + y + square(z))(1, 2, 3);




