#!/usr/bin/perl
#Array sorting without SORT just as @ QUORA solution
#nCurses lib used for output.

use Curses;

my @unsorted = @sorted = ( qw/ 7 1 3 4 2 4 6 5 5 / );

initscr();
getmaxyx($row, $col);


addstr($row / 2, ($col - length($mesg)) / 2, "Original Array:\t @sorted");

    foreach my $n (@sorted){
        foreach my $m (@sorted){if ($n<$m){ ($n, $m) = ($m , $n);}} 
    } 
addstr($row / 2+2, ($col - length($mesg)) / 2, "Sorted Array \t @sorted");


refresh();
getch();
endwin();



