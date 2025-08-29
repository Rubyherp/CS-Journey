import { unit_line, unit_line_at, rotate_around_origin,translate, make_point, x_of, y_of, draw_connected, draw_connected_full_view_proportional} from "curve";
import { make_sound, play} from "sound";

//draw line
function diagonal_line(t){//number => point
    return make_point(t,t);
}


//draw line, vary gradient, and y-intersect
function line_with(m,h){ //number => point
    return t => make_point(t,t*m+h);
}

//draw_connected_full_view_proportional(2)(line_with(2,3));


//draw circle:
function unit_circle(t){
    return display(make_point(math_cos(2*math_PI*t),
                      math_sin(2*math_PI*t)));
}

//draw_connected_full_view_proportional(10)(unit_circle);


//draw spiral:
function spiral_one(t){
    const p = unit_circle(t);
    return make_point(t * x_of(p), t * y_of(p));
}

//draw_connected_full_view_proportional(100)(spiral_one);


// add number of revolutions
//"%", give the decimal. t ranges from 0 to 1. times revs will bring to 
// over range of 0 and 1 in unit circle. %1 helps to keep it within range
function spiral(rev){
    return t => {
        const p = unit_circle((t*rev)%1); //keep the value btw 0&1
        return make_point(t * x_of(p), t * y_of(p));
    };    
}

//draw_connected_full_view_proportional(400)(spiral(10));


//or use a function helper
function spiral_alt(rev){
    function spiral_helper(t) {
        const p = unit_circle((t*rev)%1); //keep the value btw 0&1
        return make_point(t * x_of(p), t * y_of(p));
    }
    return spiral_helper;
}

//draw_connected_full_view_proportional(200)(spiral_alt(25));


//rotate line
const rot_line = 
    rotate_around_origin(0,0, math_PI/6)(unit_line);

//translate rotated line
const shifted_rot_line = 
    translate(0,10,0)(rot_line);
    
//draw_connected_full_view_proportional(20)(unit_line);

//draw_connected_full_view_proportional(20)(rot_line);
//draw_connected_full_view_proportional(20)(shifted_rot_line);



function connect_ridigly(curve1, curve2){
    return t=> t<1/2
           ? curve1(2*t)
           : curve2(2*t - 1);
}



//sound
//440 Hz
const pitch_A_wave = t => math_sin(2 * math_PI * 440 * t); //create desired sound wave
const pitch_A = make_sound(pitch_A_wave,1); //make sound, of sound wave, for duration 1

//play(pitch_A);


// C_major ==> no change in time condition
const C_maj_chord_wave = 
    t => 0.33 * math_sin(2 * math_PI * 261.63 *t) // C4
        +
         0.33 * math_sin(2 * math_PI * 329.63 *t) // E4
        +
         0.33 * math_sin(2 * math_PI * 392.00 *t);// G4
    
const C_maj_chord = make_sound(C_maj_chord_wave, 1.5);

//play(C_maj_chord);


const doremi_wave = 
    t => t < 0.5
         ? math_sin(2 * math_PI * 261.63 *t)
         : t < 1.0
         ? math_sin(2 * math_PI * 329.63 *t)
         : math_sin(2 * math_PI * 392.00 *t);
const doremi = make_sound(doremi_wave, 1.5);

play(doremi);
















