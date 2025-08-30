//28 AUG 2025
//Reflection R3

//
//
//
//
//


//1.  Substitution Model
const z = 1; 

function f(g){
    const z = 3;
    return g(z);
}

//f(y => y+z);

//
//
//
//
//

//2. 
const x= 5;

function f(g){
    const x = 3;
    return x => x + g(x);
}


function g(f,y){
    const h = (y,f) => y(f);
    return h(f, y);
}

//f(x=>2*x)(4);
//g(y=> y+2,x);

//
//
//
//
//

//Q3 Recursive process version
function my_sum(a,b){
    return a>b
    ? 0 
    :a*(a+1) + my_sum(a+1,b);
}

//my_sum(1,5);

//
//
//
//
//

//Q3 Iterative process version
const base = 0;
function iter_my_sum(a,b,n){
    return a>b
    ? n
    :iter_my_sum(a+1,b, n+(a*(a+1)));
}

//iter_my_sum(1,5, base);


//
//
//
//
//

//Q5
function sum(term,a ,next,b){
    return a>b
    ? 0 
    : term(a) + sum(x => x*(x+1), next(a), next, b);
}


function ur_sum(n){
    return sum(x => x*(x+1), 1, y => y+1, n);
}

//ur_sum(5);


function is_sum(n){
    return n===0
    ? 0
    : n*(n+1) + is_sum(n-1);
}

//is_sum(5);


// ITERATIVE SUM WITH HIGHER ORDER FUNCTION
// MY SUM CALLS SUM, WHICH CALLS ITER_SUM
function my_sum(n){
    return sum(x => x*(x+1), 1, x => x+1, n );
}

function sum(term, a, next, b){
    function iter_sum(a, total){ 
        return a > b 
        ? total
        : iter_sum(next(a), total + term(a));
    }
    return iter_sum(a, 0);
}

//my_sum(5);







