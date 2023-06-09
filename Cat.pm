#!/usr/bin/perl


package Cat;

use Animal;
use strict;
our @ISA=qw(Animal);

 sub newCat
    {
        my $class=@_;
        my $self=$class->SUPER::new ($_[1], $_[2], $_[3]);
        return bless $self, $class;
        
    }


sub meow
    {	
        my $self=shift;	
        my $newvoice=shift;	
        print "Было: ";
        Animal::say $self;
        $self->{sound}=Animal::change_voice ($newvoice);
        print "Стало:";
        Animal::say $self;
    }

