function count_pairs(x){
    let pairs = null;
    function check(y){
        if (!is_pair(y)){
            return undefined;
        }
        else if (!is_null(member(y, pairs))){
            return undefined;
        }
        else{
            pairs = append(y, pairs);
            check(head(y));
            check(tail(y));
        }
    }
    check(x);
    return length(pairs);
}

const x = list(1,2,3,4);
count_pairs(x);
