import {beside, stack, ribbon, circle, square, blank, show, heart, stack_frac, beside_frac} from 'rune';

function moony_1(bottom_right){
    return beside(stack(circle, square), stack(blank, ribbon));
}
//show(moony_1(ribbon));


function moony_2(n){
    return n ===1? circle : beside(stack(circle, square), stack(blank, moony_2(n-1))) ;
}
//show(moony_2(5));


function moony(n){
    return n ===1? circle : beside_frac(1/n,stack_frac(1/n,circle, square), stack_frac(1/n,blank, moony(n-1))) ;
}

show(moony(5));

function iter_moony(rune, n, rune2) {
    return n === 1? circle :iter_moony(beside(stack))
}
