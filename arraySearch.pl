#!/usr/bin/perl
#Array searching by linear and binary methods - self-educational Yozki sample for REG.ru
#Program may be used as sample of dirty code with copy-paste tracks like unused mindless code and so on.
$bell = chr(7); #to beep console at breakpoints.

#preparing parameters without stricts declars.
if  (@ARGV==1)  {$pattern = shift(@ARGV);} 
elsif (@ARGV >1){ #indicates array were passed in cmdline. 
    @sorted = @ARGV; 
    $pattern = shift(@sorted); #remove first element (it was a pattern).
    }
else  { #else load defaults 
    print"usage: search.pl <NUMBER> [space delimited digits: 2 3 6 2 5 22 4 8...and so on...]\n";
    print "Loading defaults...";
    $pattern =7;
    @unsorted = @sorted = ( qw/ 7 1 3 4 2 4 6 5 5 / ); 
    }
 
 
#and quickly bubbleSort this default array, ok?
foreach  $n (@sorted){ foreach  $m (@sorted){if ($n<$m){ ($n, $m) = ($m , $n);}} } 


print "$bell Let's try linearSearch first. Pattern is $pattern.
Searching in previously sorted array: \n------------\n@sorted\n------------\n";
$tragedy = "NOT MATCH :("; #presuming fail as we have pessimistic mood, have not?.
    for $i (0 .. @sorted -1) {
    select(undef, undef, undef, 0.25); #250msec pause btw searches - just to feel a process.
    print "step $i, key=", @sorted[$i],"\n";
        if (@sorted[$i] eq $pattern) {
            print "MATCH $pattern at position: $i\n";
            undef $tragedy;
            break; $i=@sorted; #comment this to multiple matches
        }
    }
print $tragedy if $tragedy;

sleep (1);

print "\n\n$bell \nNow let's search same pattern, and same array, but binary method.\n------------\n";
   
    my $min = 0;
    my $max = @sorted -1; # arrLength minus one, or we will go out of array! 
    
    print "Array length:",$max,"\n------------\n";
    
    
#the binary cycle:    
    while ($min <= $max) {
     select(undef, undef, undef, 0.25);
        
        my $middle = int(($max+$min) / 2);
        print "$min - $max  : ";
        if ($pattern < @sorted[$middle]) {
            $max = $middle-1;
            print "$pattern < @sorted[$middle]\n";
         
        }elsif ($pattern > @sorted[$middle]) {
            $min = $middle+1;
            print "$pattern > @sorted[$middle]\n";
         
        }elsif ($pattern eq @sorted[$middle]){ 
            print "$bell Match @sorted[$middle] at position $middle \n";
            exit;
        }
        

    }
        print "$bell NO Match $pattern, sorry\n\n";
