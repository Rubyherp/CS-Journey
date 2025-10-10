function make_withdraw(balance, password) {
    let count = 0
    ;
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
acc(30, "his_passcode"); // returns "Wrong password; no withdraw"
acc(30, "my_password"); // returns 70
acc(10, "sesame"); // returns "Wrong password; no withdraw"
acc(15, "canola"); // returns "Wrong password; no withdraw"
acc(25, "olive"); // returns "Wrong password; no withdraw"
acc(30, "my_password"); // returns "Account disabled"
//acc(30, "his_passcode"); // returns "Account disabled"

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
calc(75); // commission = 25
commission = 125;
calc(75); // commission = 125

//Q3
//For loop
function accumulate_array(op, init, A){
    let result = init;
    const len = array_length(A);
    
    for (let k = 0; k < len; k = k + 1){
        result = op(result, A[k]);
    }
    return result;
}
accumulate_array( (x, y) => x - y, 100, [1,2,3,4,5]);

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
accumulate_array_2( (x, y) => x - y, 100, [1,2,3,4,5]);

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
accumulate_array_3((x, y) => x - y, 100, [1,2,3,4,5]);

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
filter_array_2(x => x % 2 === 0, [1,2,3,4,5]);


// functional but incomplete

function filter_array_3(pred, A){
    const result = [];
    const len = array_length(A);
    
    function iter(count_R, count_A){
        if (count_A < len){
            if (pred(A[count_A])){
                R[count_R] = A[count_A];
                iter(count_R + 1, )
            }
        }
    }
    return result;
}
filter_array_2(x => x % 2 === 0, [1,2,3,4,5]);






