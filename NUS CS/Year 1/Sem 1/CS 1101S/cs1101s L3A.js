import {beside, stack, ribbon, circle, square, blank, show, heart, stack_frac, beside_frac} from 'rune';


function fractal_original(rune,n){
    return n === 1
        ? rune
        : beside(rune, stack(fractal_original(rune,n-1),fractal_original(rune,n-1)));
}


function fractal_1(rune,n){
    if (n=== 1) {
        return rune;
    }
    else {
        const frac = fractal_1(rune,n-1);
        return beside(rune, stack(frac, frac));

    }
}

//show(fractal(heart, 5));


function first_denomination(kind_of_coins){
    return kind_of_coins === 1 ? 5 :
           kind_of_coins === 2 ? 10 :
           kind_of_coins === 3 ? 20 :
           kind_of_coins === 4 ? 50 :
           kind_of_coins === 5 ? 100 : 0 ;
}

function cc(amount, kind_of_coins){
    return amount === 0
            ? 1
            : amount < 0 || kind_of_coins === 0
            ? 0
            : cc(amount - first_denomination(kind_of_coins), kind_of_coins)
            + 
            cc(amount, kind_of_coins -1 );
}

//cc(20,5);


function sum_intergers(a,b){
    return a > b
    ? 0 
    : a + sum_intergers(a+1,b);
}

//sum_intergers(1,5);


function cube(x){
    return x*x*x;
}

function sum_skip_cube(a,b){
    return a > b
    ? 0 
    : cube(a) + sum_skip_cube(a+2,b);
}

//sum_skip_cube(1,2);


//ABSTRACTION:
function sum(term, a, next, b){
    return a>b
        ? 0 
        : term(a) + sum(term, next(a), next, b);
}

function identity(x){
    return x;
}

function add_one(x) {
    return x+1;
}

function add_two(x){
    return x+2;
}

function cube(x){
    return x*x*x;
}

function sum_skip_cubes(a,b){
    function add_two(x){
        return x+2;
    }
    function cube(x){
    return x*x*x;
    }
    return sum(cube, a, add_two, b);
}

//sum(identity, 1, cube, 2);
//sum_skip_cubes(1,5);


//LAMBDA FUNCTION

function sum_skip_cubes_2(a, b){
    return sum(x => x*x*x, a, x => x+2, b);
}
//sum_skip_cubes_2(1,5);



















