const patties = 8;

function biggie_size(combo){
    return combo+4;
}

function unbiggie_size(combo){
    return combo-4;
}

function is_biggie_size(combo){
    return combo>4;
}

function combo_price(combo){
    return is_biggie_size(combo) ? unbiggie_size(combo)*(1.17+0.5) + 2: combo *1.17 ;
}
//not sure if this is correct
combo_price(patties);

function empty_order(){
    return 0;
}

function add_to_order(x,y){
    return x*10 + y;
}

add_to_order(1,2);

function last_combo(combo){
    return combo % 10;
}
// MODULO "%", GIVE THE REMAINDER OF THE DIVISION

last_combo(312);

function other_combos(combo){
    return math_floor(combo / 10);
}
// MATH_FLOOR 
other_combos(321);
