//QN 1
const LoN = list(1,2,3,4,5,6,7,8,9,10);

function map(f, xs){
    return is_null(xs)
    ? null
    : pair(f(head(xs)), map(f, tail(xs)));
}

//map(x => x*2, LoN);

function filter(pred, xs){
    return is_null(xs)
    ? null
    : pred(head(xs))
    ? pair(head(xs), pair(head(xs),filter(pred,(tail(xs)))))
    :filter(pred, tail(xs));
}

//filter(x => x%2 === 1, LoN);

function accumulator(op, i, xs){
    return is_null(xs)
    ? i
    : op(head(xs), accumulator(op, i, tail(xs)));
}

//accumulator((x,y) => x + y, 0, LoN);

//QN 2
//map(x => x % 2 === 1 ? list(x) : x , enum_list(1,999));


//QN 3
const LoL = list(list(1,2), list(3,4,5,6), null, list(7,8,9));

function flatten_list(xs){
    return is_null(xs)
        ? null
        : append(head(xs), flatten_list(tail(xs)));
}

//flatten_list(LoL);


//QN 4
function HO_flatten(xs){
    return accumulator((x,y) => append(x,y), null, xs);
}

function HO_flatten2(xs){
    return accumulator(append, null, xs);
} // better

HO_flatten2(LoL);


// Extra QN

function map2(f, xs){
    return accumulator((x,y) => pair(f(x), y),null,  xs);
} //implement map using accumulator

//x: 1
//x: list(20,30,40)

function filter2(pred, xs){
    return accumulator((x,y) => pred(x) ? pair(x,y) : y, null, xs );
}

//x:1
//y: list(2,4)


const l = list(1,2,3,4);
map2(x => x * 10, l); //list(10,20,30,40)
filter2(x => x%2 ===0, l);






