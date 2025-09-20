/*
Avenger Fong Zhu comes along. Fong Zhu: "Jen Wun, don't you think this grading is a bit harsh?"

Jen Wun: "What do you mean by 'a bit harsh'?"

Fong Zhu: "Well, a cadet might end up with lots of out-of-order pairs, but a sorting algorithm would only be seriously flawed if there are several inverted triples!"

You (through uplink): "Oh you mean we count the number of triples that are strictly decreasing?"

Jen Wun: "Yes, so for example in list(5, 2, 3, 1, 4), the out-of-order triples are (5,2,1) and (5,3,1). Therefore the score is 2?"

Fong Zhu: "That's right! How about you try doing that?"

A long silence ensues….

You: "I could try…"

Jen Wun: "That's the spirit!"
*/


//MY ANSWER

function within(arr, secarr, counter){ // check thru if head first > head second, then count
    if (is_null(secarr)){              // the number of elements that is head second > the element
        return counter;                // counter += length of the set
    }
    else if (head(arr) > head(secarr)){
        return within(arr, tail(secarr), counter + length(filter( x => x < head(secarr), secarr)));
    }
    else {
        return within(arr, tail(secarr), counter);
    }
}

// ChatGPT says its not a good answer, but it works =)

function graderVer2(arr) {
  // your solution here
    const first = arr;
    const second = tail(arr);
    
    function helper(first, second, counter){
        if (length(arr) < 3 || is_null(tail(first))){
            return counter;
        }
        else {
            return helper(tail(first), tail(second), within(first, second, counter));
        }
    }
    return helper(first, second, 0);
}


// test your program!
graderVer2(list(5, 2, 3, 1, 4)); // should return 2
graderVer2(list(1, 2, 3, 5, 4)); // should return 0
