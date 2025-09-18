// Reflection 6, 18 sep 

// Q1
function insert_cmp(x, xs, cmp) {
    return is_null(xs) 
           ? list(x)
           : cmp(x, head(xs)) 
           ? pair(x, xs)
           : pair(head(xs), insert_cmp(x, tail(xs), cmp));
}

function insertion_sort_cmp(xs, cmp) {
    return is_null(xs) 
           ? xs
           : insert_cmp(head(xs), 
                        insertion_sort_cmp(tail(xs), cmp),
                        cmp);
}

// Test
const xs = list(6, 3, 8, 5, 1, 9, 6, 4, 2, 7);

// (a)
//insertion_sort_cmp(xs, (x,y) => x < y); // Ascending Order
// Result: list(1, 2, 3, 4, 5, 6, 6, 7, 8, 9)

// (b)
//insertion_sort_cmp(xs, (x,y) => y < x); // Descending Order
// Result: list(9, 8, 7, 6, 6, 5, 4, 3, 2, 1)

// (c)
//insertion_sort_cmp(xs, (x,y) => false); // To reverse
// Result: list(7, 2, 4, 6, 9, 1, 5, 8, 3, 6)


// (d)

function my_cmp(x, y){
    const is_even = x => x%2 === 0;
    if (is_even(x) && !is_even(y)){ //do not swap
        return true;
    }
    else if (!is_even(x) && is_even(y)){ //swap
        return false;
    }
    else if (is_even(x) && is_even(y)){ // when x and y is even
        return x < y;
    }
    else{ // both x and y is odd
        return y < x;
    }
}

//insertion_sort_cmp(xs, my_cmp); // Sort Even first, then Odd
// Result: list(2, 4, 6, 6, 8, 9, 7, 5, 3, 1)

// This is a O(n^2) time complexity




// Q2
// half, rounded downwards
function middle(n) {            //O(1)
    return math_floor(n / 2);
}

// put the first n elements of xs into a list
function take(xs, n) {          // O(n) -> O(length of the result list) = O(numbers of elements dropped)
    return n === 0
        ? null
        : pair(head(xs), take(tail(xs), n-1));  //Recursive Process, n runtime
}

// drop the first n elements from the list and return the rest
function drop(xs, n) {          // O(n) -> O(length of the result list) = O(numbers of elements dropped)
    return n === 0
        ? xs
        : drop(tail(xs), n-1);
}

// merge two sorted lists into one sorted list
function merge(xs, ys) {
    if (is_null(xs)) {
        return ys;
    } else if (is_null(ys)) {
        return xs;
    } else {
        const x = head(xs);
        const y = head(ys);
        return x < y
               ? pair(x, merge(tail(xs), ys))
               : pair(y, merge(xs, tail(ys)));
    }                           // WORST CASE: O(length (xs) + length (ys)), when xs, ys are alternating x<y and y<x
}                               // also  = O(length of merge result)

// a list with more than one element is sorted
// by splitting it into two lists of (almost) equal
// length, sorting the halves and then merging them
// together
function merge_sort(xs) {
    if (is_null(xs) || is_null(tail(xs))) {
        return xs;
    } else {
        const mid = middle(length(xs));
        return merge(merge_sort(take(xs, mid)),
                     merge_sort(drop(xs, mid)));
    }
}

// Test
merge_sort(list(7, 6, 3, 8, 4, 6, 5, 9, 8, 3, 1, 5, 2));











