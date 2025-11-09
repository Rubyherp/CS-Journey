function zip(xs, ys){
    return is_null(xs) && is_null(ys)
        ? null
        :pair(head(xs), zip(ys, tail(xs)));
    
}

function append(xs, ys){
    return is_null(xs)
        ? ys
        : pair(head(xs), append(tail(xs),ys));
}

function reverse(xs){
    function rev(orig, reved){
        return is_null(orig)
            ? reved
            : rev(tail(orig), pair(head(orig), reved));
    }
    return rev(xs, null);
}

function map(f, xs){
    return is_null(xs)
        ? null
        : pair(f(head(xs)), map(f, tail(xs)));
}

function squarelist(xs){
    return map(x => x*x, xs);
}

function copylist(xs){
    return map(x=>x, xs);
}

function evenlist(xs){
    return is_null(xs)
        ? null
        : head(xs) % 2 === 0
            ? pair(head(xs), evenlist(tail(xs)))
            : evenlist(tail(xs));
}

function listfilter(f, xs){
    return is_null(xs)
        ? null
        : f(head(xs)) 
            ? pair(head(xs), listfilter(f, tail(xs)))
            : listfilter(f, tail(xs));
}

function sumlist(xs){
    return is_null(xs)
        ? 0
        : head(xs) + sumlist(tail(xs));
}

function accumulate(op, intial, xs){
    return is_null(xs)
        ? intial
        : op(head(xs), accumulate(op, intial, tail(xs)));
}

function map_accummulate(f, xs){
    return accumulate((x,y) => pair(f(x), y), null, xs);
}

function filter_accumulate(f, xs){
    return accumulate((x,y) => (f(x) ? pair(x, y) : y), null, xs);
}

function count_tree(tree){
    return is_null(tree)
        ? 0
        :( is_list(head(tree)) 
            ? count_tree(head(tree)) + count_tree(tail(tree))
            : 1 +  count_tree(tail(tree)));
}

function maptree(f, tree){
    return is_null(tree)
        ? null
        : is_list(head(tree)) ? pair(maptree(f, head(tree)), maptree(f, tail(tree)))
        : pair(f(head(tree)), maptree(f, tail(tree)));
}

function maptree2(f, tree){
    return map( subtree => is_list(subtree) 
            ? maptree2(f, subtree) 
            : f(subtree) , tree);
}

function filtertree(f, tree){
    return is_null(tree)
        ? null
        : is_list(head(tree)) 
            ? pair(filtertree(f, head(tree)), filtertree(f, tail(tree)))
            : f(head(tree)) 
                ? pair(head(tree), filtertree(f, tail(tree)))
                : filtertree(f, tail(tree));
}

//Insertion sort: Sort tail using wishful thinking
//Decide where to insert first value
function insertion_sort(xs){ //Part 1
    return is_null(xs)
        ? xs
        : insert(head(xs), insertion_sort(tail(xs)));
}

function insert(value, xs){ //Part 2
    return is_null(xs)
        ? pair(value, xs) //or list(value)
        : value >= head(xs) ? pair(head(xs), insert(value, tail(xs)))
                            : pair(value, xs);
}

function remove_1(value, xs){
    if (value === head(xs)){
        return tail(xs);
    }
    else {
        return pair(head(xs), remove(value, tail(xs)));
    }
}
function remove_all(value, xs){
    return is_null(xs)
        ? null
        : value === head(xs) 
            ? remove_all(value, tail(xs)) 
            : pair(head(xs), remove_all(value, tail(xs)));
}

function selection_sort(xs){
     if (is_null(xs)){
        return xs;
     } else {
        const small = smallest_accumulate(xs); 
        return pair(small, selection_sort(remove_1(small, xs))); //take note to remove smallest
    }
}

function smallest(xs){
    function helper(xs, cur_smallest){
        return is_null(xs)
            ? cur_smallest
            : head(xs) <= cur_smallest ? helper(tail(xs), head(xs)) : helper(tail(xs), cur_smallest);
    }
    return helper(xs, head(xs));
}

function smallest_accumulate(xs){
    return accumulate((x, y) => x < y ? x : y, head(xs), tail(xs)); //take note that its tail of xs. its head is init
}

function merge_sort(xs){ //mistake 1: nv mergesort both take and drop
// mistake 2: nv check is_null(tail(xs))
    if (is_null(xs) || is_null(tail(xs))){
        return xs;
    } else {
        const middle = math_floor(length(xs) / 2);
        return merge(merge_sort(take(xs, middle)), merge_sort(drop(xs, middle)));
    }
}

function take(xs, pos){
    return pos === 0
        ? null //mistake 3: base case not null
        : pair(head(xs), take(tail(xs), pos - 1));
        
}

function drop(xs, pos){ //mist
    return pos === 0
        ? xs //mistake 4: put tail(xs) instead of xs
        : drop(tail(xs), pos - 1);
}

function merge(xs, ys){
    if (is_null(xs)){
        return ys;
    }
    else if (is_null(ys)){
        return xs;
    }
    else if (head(xs) <= head(ys)){
        return pair(head(xs), merge(tail(xs), ys));
    }
    else {
        return pair(head(ys), merge(xs, tail(ys)));
    } //mistake 5 & 6: xs, ys instead of head(xs) and head(ys) 
}


function int_from_stream(n){
    return pair(n, () => int_from_stream(n+1));
}


function factorial(n){
    return fac_helper(n, x => x);
}

function fac_helper(n, conti){
    return n === 1 || n === 0
        ? conti(1)
        : fac_helper(n-1, x => conti(n * x));
}

function make_account(initial_balance){
    let balance = initial_balance;
    function withdraw(amount){
        if (initial_balance < amount){
            return "Insufficient Funds";
        }    
        else{
            balance = balance - amount;
            display(balance, "Balance: ");
            return balance;
        }
    }
    return withdraw;
    
}

function dappend(xs, ys){
    if (is_null(xs)){
        return ys;
    }else{
        set_tail(xs, dappend(tail(xs), ys));
        return xs;
    }
}

function dmap(f, xs){
    if (!is_null(xs)){
        set_head(xs, f(head(xs)));
        dmap(f, tail(xs));
    }
    else {}
}

function dfilter(f, xs){
    if (is_null(xs)){
        return null;
    }
    while (!is_null(xs) && !f(head(xs))){
        xs = tail(xs); //checking head of xs. if condition is false, xs = tail(xs) will skip it
    }
    if (is_null(xs)){
        return null;
    }
    let cur = xs;
    
    while(!is_null(tail(cur))){ //check next head from current. If false, skip it, point to next tail
        if (!f(head(tail(cur)))){
            set_tail(cur, tail(tail(cur)));
        }
        else {
            cur = tail(cur); // if condition is true, set cur to tail
        }
    }
    return xs;
}
 
function from_1_arr(n){
    const a = [];
    function iter(count){
        while (count < n){
            a[count] = count + 1;
            count = count + 1;
        }
        return a;
    }
    return iter(0);
}

function map_array(f, arr){
    const length = array_length(arr);
    for (let i = 0; i < length; i = i + 1){
        arr[i] = f(arr[i]);
    }
    return arr;
}

function map_arr2(f, arr){
    const length = array_length(arr);
    function iter(count){
        if(count < length){
            arr[count] = f(arr[count]);
            iter(count + 1);
        }
        return arr;
    }
    return iter(0);
}

function fac_while(n){
    let acc = 1;
    let k = 1;
    while (k<=n){
        acc = acc * k;
        k = k +1;
        
    }
    return acc;
}

function list_length_loop(xs){
    let len = 0;
    for (let pos = xs; !is_null(pos); pos = tail(pos)){
        len = len + 1;
    }
    return len;
}

function zero_matrix(r,c){
    const arr = [];
    for (let rw = 0; rw < r ; rw = rw + 1 ){
         arr[rw] = [];
        for (let cl = 0; cl < c ; cl = cl + 1 ){
            arr[rw][cl] = 0;
        }
    }
    return arr;
}

function cps(n, cont){
    return n === 1
        ? cont(n)
        : cps(n - 1, x => cont(n * x));
}

function fac_cps(n){
    return cps(n, x => x);
}

function fcps(n, conti){
    return n === 0
        ? conti(0)
        : n === 1
        ? conti(1)
        : fcps(n - 1, x => fcps(n-2, y => conti(x + y)));
}

function fib_cps(n){
    return fcps(n, x => x);
}

function linear_search(arr, value){
    const len = array_length(arr);
    let i = 0;
    while (i < len && arr[i] !== value){
        i = i + 1;
    }
    return (i < len);
}


function binary_search_loop(arr, value){
    let low = 0;
    let high = array_length(arr) - 1;
    while (low <= high){
        let middle = math_floor((low + high)/2);
        if (arr[middle] === value){
            break;
        } else if (arr[middle] > value){
            high = middle - 1;
        } else {
            low = middle + 1;
        }
    }
    return low <= high;
}

function binary_search_recursion(arr, value){
    function search(low, high){
        const mid = math_floor((low + high) / 2);
        if (low > high){
            return false;
        }
        else if(arr[mid] === value){
            return true;
        }
        else if (arr[mid] > value){
            return search(low, mid - 1);
        }
        else{
            return search(mid + 1, high);
        }
        
    }
    return search(0, array_length(arr) - 1);
}

function binary_search_recursion_model(arr, value){
    function search(low, high){
        if (low > high){
            return false;
        }
        else{
            const mid = math_floor((low + high) / 2);
            return (arr[mid] === value) ||( arr[mid] > value ? search(low, mid - 1) : search(mid + 1, high));
        } // take note the BRACKETS ARE EXTREMELY CRUCIAL. ELSE IT WOULDNT WORK!!!!!!!!
    }
    return search(0, array_length(arr) - 1);
}

function swap_arr_ele(arr, i, j){
    const temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

function selection_sort_arr(arr){
    const len = array_length(arr);
    for (let i = 0; i < len - 1; i = i + 1 ){
        let min_index = find_min_index(arr, i, len - 1); //swapping with the smallest element to the right of i
        swap_arr_ele(arr, i, min_index);
    }
}

function find_min_index(arr, i, n){
    let curmin = i;
    let t = i + 1;
    while (t < n){
        if (arr[curmin] > arr[t]){
            curmin = t;
        }
        t = t + 1;
    }
    return curmin;
}

function insertion_sort_arr(arr){
    const len = array_length(arr);
    for (let i = 1; i < len; i = i + 1){
        for (let j = i - 1; j >= 0; j = j-1){
            if (arr[j + 1] < arr[j]){ //mistake: arr[i] < arr[j] -> this doesn't work
                swap_arr_ele(arr, j, j+1);
            }
        }
    }
}

function merge_sort_arr(arr){
    merge_sort_helper(arr, 0, array_length(arr)-1);
    return arr;
}

function merge_sort_helper(arr, low, high){
    if(low < high){
        const mid = math_floor((low + high) /2);
        merge_sort_helper(arr, low, mid); //Wishful thinking
        merge_sort_helper(arr, mid + 1, high);
        merging(arr, low, mid, high);
    }
}

function merging(arr, low, mid, high){
    const b = [];
    let left = low;
    let right = mid + 1;
    let bindex = 0;
    while (left <= mid && right <= high){
        if (arr[left] <= arr[right]){
            b[bindex] = arr[left];
            left = left + 1;
        } else {
            b[bindex] = arr[right];
            right = right + 1;
        }
        bindex = bindex + 1;
    }
    while (left <= mid){
        b[bindex] = arr[left];
        left = left + 1;
        bindex = bindex + 1;
    }
    while (right <= high){
        b[bindex] = arr[right];
        right = right + 1;
        bindex = bindex + 1;
    }
    for (let k = 0; k < high - low + 1; k = k + 1){
        arr[low + k] = b[k];
    }
}



function memofib(n){
    const mem = [];
    
    function fib(k){
        if (mem[k] !== undefined){
            return mem[k];
        } else{
            const result = k <= 1? k : fib(k-1) + fib (k-2);
            mem[k] = result;
            return result;
        }
    }
    return fib(n);
}

// memoization function as 1D array:
function memoize(fun){
    const mem = [];
    
    function mf(x){
        if(mem[x] !== undefined){
            return mem[x];
        }
        else{
            const result = fun(x);
            mem[x] = result;
            return result;
        }
    }
    return mf;
}

//const fib = x => x <= 1 ? x : fib(x- 1) + fib(x- 2);
//OR
function fibfib(n){
    return n <= 1
        ? n
        : fibfib(n-1) + fibfib(n-2);
}

//Correct memoize fibonacci implementation
const mfib = memoize(n => n <= 1 ? n : mfib(n-1) + mfib(n-2)); 


function choose(n, r){
    return r > n
        ? 0
        : r === 0 || r === n
        ? 1
        : choose(n-1, r) + choose(n-1, r-1);
}


// Read,write in a global 2D array for memoization
const memoglobal = [];

function read(n, k){
    return memoglobal[n] === undefined
        ? undefined
        : memoglobal[n][k];
}

function write(n, k, value){
    if(memoglobal[n] === undefined){
        memoglobal[n] = [];
    } 
    memoglobal[n][k] = value;
}

function memochoose(n, r){
    if (read(n, r) !== undefined){
        return read(n, r);
    }
    else{
        const result = (r > n) ? 0 : ((r === 0 || r === n) ? 1 : (memochoose(n-1, r-1)+ memochoose(n-1, r)));
        write(n, r, result);
        return result;
    }
}

function moreandmore(a, b){
    return a>b
        ? moreandmore(1, b+1)
        : pair(a, () => moreandmore(a+1,b));
}

const moreandmorrr = moreandmore(1,1);

function replace(stream, a, b){
    return head(stream) === a
        ? pair(b, () => replace(stream_tail(stream), a, b))
        : pair(head(stream), () => replace(stream_tail(stream), a, b));
}

function replace_model(stream, a, b){
    return pair((head(stream) === a ? b : head(stream)), () => replace(stream_tail(stream), a, b));
}

function infstream_of_xs(xs){
    if(is_null(xs)){
        return null;
    }
    else{
        const input = head(xs);
        const newxs = append(remove(input, xs), list(input));
        return pair(input, () => infstream_of_xs(newxs));
    }
}

function infstream_of_xs_model(xs){
    function helper(ys){
        return is_null(ys)
            ? helper(xs)
            : pair(head(ys), () => helper(tail(ys)));
    }
    return is_null(head(xs)) ? null : helper(xs);
}

const rep123 = pair(1, () => pair(2, () => pair(3, () => rep123)));

function add_stream(s1, s2){
    return is_null(s1)
        ? s2
        : is_null(s2)
        ? s1
        : pair(head(s1) + head(s2), () => add_stream(stream_tail(s1), stream_tail(s2)));
}

const fibsstream = pair(0, 
                        () => pair(1,
                                    () => add_stream(stream_tail(fibsstream), fibsstream)));

const ones = pair(1, () => ones);
const integers = pair(1, () => add_stream(ones, integers));



 
// memoize streams:
function memo_fun(fun){
    let already_ran = false;
    let result = undefined;
    
    function mfun(){
        if (!already_ran){ //if havent run before
            result = fun(); 
            already_ran = true;
            return result;
        } else {
            return result; //if ran before
        }
    }
    return mfun;
}

function ms(m, s){
    display(m);
    return s;
}

const memoize_ones = pair(1, memo_fun(() => memoize_ones)); //memo_fun in front of nullary function

function m_intergers_from(n){
    return pair(n, memo_fun(() => ms("M: " + stringify(n), m_intergers_from(n+1))));
}

const m_integers = m_intergers_from(1);

//eval_stream(memoize_ones, 5);
// stream_ref(m_integers, 10);
// stream_ref(m_integers, 4);
// stream_ref(m_integers, 7);
// stream_ref(m_integers, 3); // Notice that if want 3, wont get memoized again
function bubblesort(arr){
    const len = array_length(arr);
    for (let i = len -1; i >= 1; i = i - 1){
        for (let j = 0; j < i; j = j + 1){
            if (arr[j] > arr[i]){
                const temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}


// const idk4 = [1,2,4,5,212,4,5,6,4,23,2,45,65];
// const idk5 = list(1,4,2,45,6,78,4,3,65,7);
// bubblesort(idk4);

function bubblesort_list(xs){
    const len = length(xs);
    for (let i = len -1; i >= 1; i = i - 1){
        let p = xs;
        for (let j = 0; j < i; j = j + 1){
            if (head(p) > head(tail(p))){
                const temp = head(p);
                set_head(p, head(tail(p)));
                set_head(tail(p), temp);
            }
            p = tail(p);
        }
    }
    return xs;
}

// const cs = list(1,243,54,2,1,3,54,65,6,34,233);
// bubblesort_list(cs);

const mem3 = [];

function read3(n, k) {
    return mem3[n] === undefined
           ? undefined
           : mem3[n][k];
}

function write3(n, k, value) {
    if (mem3[n] === undefined) {
        mem3[n] = [];
    }
    mem3[n][k] = value;
}

function first_denomination3(kinds_of_coins) {
    return kinds_of_coins === 1 ?   5 :
           kinds_of_coins === 2 ?  10 :
           kinds_of_coins === 3 ?  20 :
           kinds_of_coins === 4 ?  50 :
           kinds_of_coins === 5 ? 100 : 0;
}

// The non-memoized version.
function cc3(amount, kinds_of_coins) {
    return amount === 0
           ? 1
           : amount < 0 || kinds_of_coins === 0
           ? 0
           : cc3(amount, kinds_of_coins - 1)
             +
             cc3(amount - first_denomination3(kinds_of_coins),
                kinds_of_coins);
}

// The memoized version.
// n is the amount in cents, and k is the number of denominations.
function mcc(n, k) {
    if (n >=0 && k >= 0 && read3(n, k) !== undefined){
        return read3(n, k);
    } else {
        const result = n === 0
           ? 1
           : n < 0 || k === 0
           ? 0
           : mcc(n, k - 1) + mcc(n - first_denomination3(k),k);
        if (n >=0 && k >= 0)  {   
            write3(n, k, result);
        }
        return result;
    }
}

// mcc(365, 5);  // Expected result: 1730

const lon = list(1,2,3,4,5,6,7,8,9,10);
const is_even = x => x % 2===0;
const enuming = enum_list(1, 10);

// map(x => x *2, lon);
// map(x => is_even(x) ? x -1 : x, lon);
// accumulate((x,y) => is_even(x) ? x + y : 0 + y, 0, lon);
// accumulate((x,y) => x + y, 0, filter(is_even, lon));
// map(x => is_even(x) ? x : list(x), enuming);


function accumulator(op, i, xs){
    return is_null(xs)
    ? i
    : op(head(xs), accumulator(op, i, tail(xs)));
}

//accumulator((x,y) => x + y, 0, lon);

function map2(f, xs){
    return accumulator((x,y) => pair(f(x), y),null,  xs);
} //implement map using accumulator

//x: 1
//x: list(20,30,40)

function filter2(pred, xs){
    return accumulator((x,y) => pred(x) ? pair(x,y) : y, null, xs );
}


function flattenlist(xs){
    return is_null(xs)
        ? null
        : append(head(xs), flattenlist(tail(xs)));
}

function flattenlist_HO(xs){
    return accumulate((x, y) => append(x, y), null, xs);
}


const lol = list(list(1,2), list(3,4,5,6), null, list(7,8,9));
// flattenlist_HO(lol);


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
// one_half;

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
            pairs = pair(y, pairs);
            check(head(y));
            check(tail(y));
        }
    }
    check(x);
    return length(pairs);
}

// const ds = list(1,2,3,4);
// count_pairs(ds);


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
//const xs = list(6, 3, 8, 5, 1, 9, 6, 4, 2, 7);

// (a)
//insertion_sort_cmp(xs, (x,y) => x < y); // Ascending Order
// Result: list(1, 2, 3, 4, 5, 6, 6, 7, 8, 9)

// (b)
//insertion_sort_cmp(xs, (x,y) => y < x); // Descending Order
// Result: list(9, 8, 7, 6, 6, 5, 4, 3, 2, 1)

// (c)
//insertion_sort_cmp(xs, (x,y) => false); // To reverse
// Result: list(7, 2, 4, 6, 9, 1, 5, 8, 3, 6)


// (d) To sort even numbers at the front, then sort odd numbers at the back of list

function even_first_odd_second(x, y){
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

//insertion_sort_cmp(xs, even_first_odd_second); // Sort Even first, then Odd
// Result: list(2, 4, 6, 6, 8, 9, 7, 5, 3, 1)

// This is a O(n^2) time complexity


//For loop
function accumulate_array(op, init, A){
    let result = init;
    const len = array_length(A);
    
    for (let k = 0; k < len; k = k + 1){
        result = op(result, A[k]);
    }
    return result;
}
// accumulate_array( (x, y) => x - y, 100, [1,2,3,4,5]);

//while loop
function accumulate_array_2(op, init, A){
    let result = init;
    const len = array_length(A);
    let i = 0;
    while (i<len){
        result = op(result, A[i]);
        i = i + 1;
    }
    return result;
}
// accumulate_array_2( (x, y) => x - y, 100, [1,2,3,4,5]);

//functional programming
function accumulate_array_3(op, init, A){
    const len = array_length(A);
    function iter(i, acc){
        if (i < len){
            return iter(i+ 1, op(acc, A[i]));
        }
        else{
            return acc;
        }
    }
    return iter(0, 100);
}
// accumulate_array_3((x, y) => x - y, 100, [1,2,3,4,5]);

//Q4
function filter_array(pred, A){
    const result = [];
    const len = array_length(A);
    let count = 0;
    
    for (let i = 0; i < len; i = i + 1){
        if (pred(A[i])){
            result[count] = A[i];
            count = count + 1;
        }
    }
    return result;
}
//filter_array(x => x % 2 === 0, [1,2,3,4,5]);

function filter_array_2(pred, A){
    const result = [];
    const len = array_length(A);
    let count = 0;
    let i = 0;
    while (i < len){
        if (pred(A[i])){
            result[count] = A[i];
            count = count + 1;
        }
        i = i + 1;
    }
    return result;
}
// filter_array_2(x => x % 2 === 0, [1,2,3,4,5]);


// functional
function filter_array_3(pred, A){
    const result = [];
    const len = array_length(A);
    function iter(count_R, count_A){
        if (count_A < len){
            if (pred(A[count_A])){
                result[count_R] = A[count_A];
                return iter(count_R + 1, count_A + 1);
            } else{
                return iter(count_R, count_A + 1);
            }
        }
        return result;
        }
    return iter(0, 0);
}
    
// filter_array_3(x => x % 2 === 0, [1,2,3,4,5]);

function make_withdraw(balance, password) {
    let count = 0;
    function withdraw(amount, verfication_password) {
        if (count >= 3){
            return "Account Locked";
        } else {
            if (verfication_password  === password){
                count = 0;
                if (balance >= amount) {
                    balance = balance - amount;
                    return balance;
                } else {
                    return "Insufficient funds or ";
                }
            } else {
                count = count + 1;
                return "Wrong password";
                }
        }
    }
    return withdraw;
}
//Q1 part 1
/*
const W1 = make_withdraw(100, "money");
const W2 = make_withdraw(57, "money");
display(W1(40, "money"));
display(W2(50, "idk"));
*/

//Q1 part 2
const acc = make_withdraw(100, "my_password");
// acc(30, "his_passcode"); // returns "Wrong password; no withdraw"
// acc(30, "my_password"); // returns 70
// acc(10, "sesame"); // returns "Wrong password; no withdraw"
// acc(15, "canola"); // returns "Wrong password; no withdraw"
// acc(25, "olive"); // returns "Wrong password; no withdraw"
// acc(30, "my_password"); // returns "Account disabled"
// acc(30, "his_passcode"); // returns "Account disabled"

//Q2
let commission = 25; // my commission in dollars
// return a calculator for total price
// total price = (commission + cost) * (1 + tax_rate)
function make_price_calculator(tax_rate) {
    function calculator(cost) {
        return (commission + cost) * (1 + tax_rate);
        }
    return calculator;
}
const calc = make_price_calculator(0.07);
// calc(75); // commission = 25
// commission = 125;
// calc(75); // commission = 125


function make_search(A){
    return x => linear_search2(A, x);
}

function linear_search2(A,x){
    const len = array_length(A);
    for (let i = 0; i < len; i = i + 1){
        if (A[i] === x){
            return true;
        }
    }
    return false;
}

function make_optimized_search(A){
    const b = merge_sort_arr(A); //sort first, before binary search
    return x => binary_search_recursion_model(b, x);
}

const arr4 = [3,4,56,67,4,32,2,43,45,6,54,34,5];
const my_search = make_search(arr4);
const my_search2 = make_optimized_search(arr4);
// my_search2(8);


function fib_dp(n){
    let res = [0, 1];
    for (let i = 2; i <= n; i = i + 1){
        res[i] = res[i-1] + res[i-2];
        
    }
    return res;
}

// fib_dp(5);

function fib_3variable(n){
    if (n === 0){
        return 0;
    }
    let a = 0;
    let b = 1;
    let c = -1;
    while (n > 1){
        c = b;
        b = a + b;
        a = c;
        n = n -1;
    }
    return b;
}

//fib_3variable(10);

function fib_2variable(n){
    let x = 0;
    let y = 1;
    for (let i = 0; i < n; i = i + 1){
        y = y + x ;
        x = y - x ;
    }
    return x;
}

//fib_2variable(10);


function mul_streams(s1, s2){
    return pair(head(s1) * head(s2),
                    () => mul_streams(stream_tail(s1), stream_tail(s2)));
}

// display(eval_stream(createinfstream, 10));
// display(eval_stream(nums, 10));
// eval_stream(multiplystreams, 10);


function scale_stream(c, stream){
    return stream_map(x=> x * c, stream);
}

function infstream3_gpt(n) {
    function helper(prev) {
        const next = prev * 10 + n;
        return pair(next, () => helper(next));
    }
    return helper(0);
}

function infstream3(n){
    function streaming(a, count){
        return pair(a + (math_pow(10, count) * n), () => streaming(a + (math_pow(10, count)) * n, count + 1));
    }
    return streaming(0, 0);
}

const streaminginf1 = infstream3(1);
const streaminginf2 = infstream3(2);
const streaminginf3 = infstream3(3);
// eval_stream(streaminginf1, 5);

function zip_stream(s1, s2){
    return pair(head(s1), () => zip_stream(s2, stream_tail(s1)));
}

const zippinginf1and2 = zip_stream(streaminginf1, streaminginf2);

// eval_stream(zippinginf1and2, 5);


function zip_list_of_streams(xs){
    function helper(streams){
        const first_stream = head(streams);
        const rest_stream = tail(streams);
        const rotate_stream = append(rest_stream, list(stream_tail(first_stream)));
        return pair(head(first_stream), () => helper(rotate_stream));
    }
    return helper(xs);
}

const listofstreams = list(streaminginf1, streaminginf2, streaminginf3);
const zippedlistofstreams = zip_list_of_streams(listofstreams);

// eval_stream(zippedlistofstreams, 10);



function partial_sums(integers){
    const partials = pair(head(integers), () => add_stream(stream_tail(integers), partials));
    return partials;
}

const integer1stream = integers_from(1);
const partials = partial_sums(integer1stream);
// eval_stream(partials, 5);




const xs = list(1,3,5);
const ys = list(2,4);
const zs = list(1,2,3,4,5,6,7,8,9,10);
const tr = list(list(1,2,3),4,5,null,list(4,null));
const rr = list(list(1,2,3),4,5, list(6, null));
const rand = list(1,6,24,76,8,5,3);
const notrand = list(1,2,3,1,2,3,123);
const acc1 = make_account(100);
const a = list(1,2,3);
const b = list(4,5,6);
const c = dappend(a, b);
const d = dmap(x => x*x, a);
const e = dfilter(x => x % 2 === 0, a);
const arr = [1,2,3,4,5];
const arr2 = [1,2,3,4,5,6,7,8,9];
const arrrand = [1,2,4,23,543,6,456,5,74,543];
const memofibconst = memoize(fibfib);
const replacing = replace_model(moreandmorrr, 1, 0);
const createinfstream = infstream_of_xs(list(1,2,3));
const createinfstream2 = infstream_of_xs_model(list(1,2,3));
const nums = int_from_stream(1);
const addingstreams = add_stream(createinfstream, nums);
const multiplystreams = mul_streams(createinfstream, nums);




//map(x => x*x, zs);
//squarelist(zs);
//copylist(zs);
//listfilter(x => (x % 2) === 1, zs);
//sumlist(zs);
//accumulate((x, y) => x * y, 1, xs);
//map_accummulate(x => x*x, zs);
//filter_accumulate(x => x %2 ===0, zs);
//display(filtertree(x => x%2 ===0 , rr));
//insertion_sort(rand);
//remove(5, rand);
//remove_all(3, notrand);
//merge_sort(rand);
//eval_stream(nums, 5);
//factorial(5);
//acc1(40);
//acc1(50);
//display(e);
//to_arr(5);
//map_array(x=> x*x, arr);
//map_arr2(x=>x*x, arr);
//fac_while(5);
//list_length_loop(xs);
//zero_matrix(3,3);
//fac_cps(5);
//fib_cps(6);
//linear_search(arrrand, 543);
//binary_search_recursion_model(arr2, 6);
////swap_arr_ele(arr2, 5, 8);
//arr2;
//selection_sort_arr(arrrand);
//arrrand;
//insertion_sort_arr(arrrand);
//arrrand;
//merge_sort_arr(arrrand);
//arrrand;
//memofib(7);
//mfib(7); 
//memofibconst(7);
//choose(5,1);
//memochoose(5,3);
//eval_stream(createinfstream2, 20);
//eval_stream(replacing, 10);
//eval_stream(rep123, 10);
//eval_stream(addingstreams, 10);
//eval_stream(fibsstream, 10);
//eval_stream(integers, 10);


//===============================================================
// TASK 1A
//===============================================================

function make_k_list(k, d) {
    if (d === 0) {
        return 0;
    } else {
        let klist = null;
        for (let i = 0; i < k; i = i + 1) {
            klist = pair(make_k_list(k, d - 1), klist);
        }
        return klist;
    }
}



//===============================================================
// TASK 1B
//===============================================================

function sum_k_list(klist) {
    if (is_number(klist)) {
        return klist;
    } else {
        const k = length(klist);
        let sum = 0;
        let rest = klist;
        for (let i = 0; i < k; i = i + 1) {
            sum = sum + sum_k_list(head(rest));
            rest = tail(rest);
        }
        return sum;
    }
}



//===============================================================
// TASK 1C
//===============================================================

function map_k_list(f, klist) {
    if (is_number(klist)) {
        return f(klist);
    } else {
        const k = length(klist);
        let result = null;
        let rest = klist;
        for (let i = 0; i < k; i = i + 1) {
            result = pair(map_k_list(f, head(rest)), result);
            rest = tail(rest);
        }
        return reverse(result);
    }
}



//===============================================================
// TASK 2A
//===============================================================

function route_distance(mat, route) {
    function add_dist(rou) {
        if (is_null(rou) || is_null(tail(rou))) {
            return 0;
        } else {
            return mat[head(rou)][head(tail(rou))] + add_dist(tail(rou));
        }
    }
    return add_dist(route);
}


// PA 1

//===============================================================
// TASK 2B
//===============================================================

function shortest_paper_route(n, mat, start) {

    // You can keep, modify or remove the permutations function.
    function permutations(ys) {
        return is_null(ys)
            ? list(null)
            : accumulate(append, null,
                map(x => map(p => pair(x, p),
                             permutations(remove(x, ys))),
                    ys));
    }

    const others = remove(start, enum_list(0, n - 1));
    const routes = permutations(others);

    let min_dist = Infinity;
    let min_route = null;

    for (let p = routes; !is_null(p); p = tail(p)) {
        const pp_route = pair(start, append(head(p), list(start)));
        const route_dist = route_distance(mat, pp_route);
        if (route_dist < min_dist) {
            min_dist = route_dist;
            min_route = pp_route;
        } else { }
    }
    return pair(min_route, min_dist);
}



//===============================================================
// TASK 3A
//===============================================================

function make_postfix_exp(bae) {
    const pfe = [];
    let next = 0;

    function convert(sub_bae) {
        if (is_number(sub_bae)) {
            pfe[next] = sub_bae;
            next = next + 1;
        } else {
            convert(sub_bae[0]);
            convert(sub_bae[2]);
            pfe[next] = sub_bae[1];
            next = next + 1;
        }
    }
    convert(bae);
    return pfe;
}



//===============================================================
// TASK 3B
//===============================================================

function eval_postfix_exp(pfe) {
    let next = array_length(pfe) - 1;

    function evaluate() {
        const token = pfe[next];
        next = next - 1;
        if (is_number(token)) {
            return token;
        } else {
            const op = token;
            const right = evaluate();
            const left = evaluate();
            if (op === "+") {
                return left + right;
            } else if (op === "-") {
                return left - right;
            } else if (op === "*") {
                return left * right;
            } else {
                return left / right;
            }
        }
    }
    return evaluate();
}

























