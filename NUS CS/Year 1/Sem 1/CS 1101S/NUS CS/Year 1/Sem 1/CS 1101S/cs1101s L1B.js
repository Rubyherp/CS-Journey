//ON SOURCEACADEMY 

import {rcross, sail, corner, nova, heart, show, pink,
        quarter_turn_right, stack, stackn, repeat_pattern} from "rune";
 
 
function turn_upside_down(rune){
    return quarter_turn_right(quarter_turn_right(rune));    
}

//show(turn_upside_down(turn_upside_down(pink(heart))));


function quarter_turn_left(rune){
    return quarter_turn_right(turn_upside_down(rune));
}

//show(quarter_turn_left(pink(heart)));


//show(stack(heart,stack(heart,heart))); 
//we turned stack(heart,heart) INTO A RUNE: 50% of BOTTOM !!


function beside(rune1, rune2){
    return(quarter_turn_left(stack(quarter_turn_right(rune1), quarter_turn_right(rune2))));
}

//show(beside(heart,heart));

const pink_heart = pink(heart);

//show(stackn(2, pink_heart));


const my_quilt = stackn(5, quarter_turn_right(stackn(5, quarter_turn_left(pink_heart))));

//show(my_quilt);



function quilt(n,m,rune){
    return stackn(n,
        quarter_turn_right(
            stackn(m,
            quarter_turn_left(rune))));
}

//show(quilt(5,5,heart));

function make_cross(rune){
    return stack(beside(quarter_turn_right(rune), turn_upside_down(rune)), beside(rune, quarter_turn_left(rune)));
}


show(repeat_pattern(5,make_cross,heart));

const sa_blanket = repeat_pattern(5, make_cross, pink(nova));
show(sa_blanket);

//repeat_pattern(3,f,r)
























