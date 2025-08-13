function circle_area(radius) {
    return math_PI * square(radius);
}

function square(x){
    return x*x;
}

circle_area(2);

//function calls. 


3<=4; //boolean value



//const age = 16;
//age >= 18;

function check_age(age){
    return age >= 18;
}
function movie_theather(age){
    return check_age(age)? "welcome in" : "Take a hike";
    //conditional expression:
    //predicate? Consequent : Alternate
}

movie_theather(12);

//if x >= 0, return x | otherwise return -x

function abs(x){
    return x>=0? x : -x;
}

abs(-10);
