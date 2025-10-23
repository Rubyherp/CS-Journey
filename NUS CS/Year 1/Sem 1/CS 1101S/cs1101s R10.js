// Reflection 10

//QN 2a
let arr = [0, 1]; // DYNAMIC PROGRAMMING

function fib(n){
    for (let i = 2; i <= n ; i = i + 1){
        arr[i] = arr[i-1] + arr[i-2];
    }
    return arr;
}

fib(10);


//QN 2b // 3 variables
let a = 0;
let b = 1;
let c = -1;
function fib2(n){
    while (n > 1){
        c = b;
        b = a + b;
        a = c;
        n = n -1;
    }
    return b;
}

fib2(10);

//QN 2b // 2 variables
let x = 0;
let y = 1;
function fib3(n){
    for (let i = 0; i < n; i = i + 1){
        y = y + x ;
        x = y - x ;
    }
    return x;
}

fib3(10);
