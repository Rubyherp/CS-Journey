const pair = (x, y) => f => f(x,y);
const head = p => p((x, y) => x);
const tail = p => p((x, y) => y);

//head(pair(3, 5));
//tail(pair(3, 5));



function make_rational(x, y){
    return pair(x,y);
}

function numerator(x){
    return head(x);
}

function denominator(x){
    return tail(x);
}

function add_rational(x,y){
    return make_rational(numerator(x) * denominator(y)+ numerator(y) * denominator(x)
        ,
        denominator(x) * denominator(y));
}

//Greatest common divisor
function gcd(a,b){
    return b === 0 ? a : gcd(b, a%b);
}

function new_make_rational(x,y){
    const g = gcd(x,y);
    return pair(x/g, y/g);
}
//const one_half = new_make_rational(200,120);
one_half;




