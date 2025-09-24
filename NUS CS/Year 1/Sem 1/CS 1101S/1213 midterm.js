const solution = list ( list (9 , 5, 4, 1, 6, 2, 3, 8, 7),
                        list (2 , 6, 8, 7, 4, 3, 1, 5, 9),
                        list (3 , 7, 1, 5, 9, 8, 2, 6, 4),
                        list (7 , 9, 3, 6, 8, 4, 5, 1, 2),
                        list (5 , 8, 6, 2, 1, 7, 4, 9, 3),
                        list (4 , 1, 2, 3, 5, 9, 6, 7, 8),
                        list (6 , 3, 9, 4, 7, 5, 8, 2, 1),
                        list (1 , 2, 7, 8, 3, 6, 9, 4, 5),
                        list (8 , 4, 5, 9, 2, 1, 7, 3, 6));

function make_coordinates (row , column ) {
    return pair (row , column );
}

function get_x ( coordinates ) {
    return head ( coordinates );
}

function get_y ( coordinates ) {
    return tail ( coordinates );
}

function make_row_coordinates_list (row) {
    return build_list (col => make_coordinates(row , col ), 9);
}

function access ( coordinates , grid ) {
    return list_ref ( list_ref ( grid ,get_x ( coordinates )) ,get_y ( coordinates ));
}

function all_different ( xs ) {
    if ( is_null ( xs )) {
        return true ;
    } 
    else {
        return is_null ( member ( head ( xs ), tail ( xs )))
        &&
        all_different ( tail ( xs ));
    }
}

function test_coordinates_list(grid, coordinates_list) {
    const xs = map(
        coordinates => access(coordinates, grid),
        coordinates_list);
    return all_different(xs);
}

test_coordinates_list ( solution , make_row_coordinates_list (0));








