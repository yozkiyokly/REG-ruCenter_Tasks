#!/usr/bin/perl


package Animal;


sub new
{ 	
    my $class=shift;	
    my $self={name=>shift, sound=>shift};
    return bless $self, $class;
}

sub say {	
    my $self=shift; 	
    print "Здравствуйте, я $self->{name}. $self->{sound}!\n"; 
}


sub change_voice {	
    my $self=shift; 
    my $newvoice=shift;

    if ($newvoice){
        print "новый голос: $newvoice";
        $self->{name}=$name ; 
        $self->{sound}=$newvoice ; 
        } else {
         $self->{sound}="\nКва... хрю... гав... \n Нет. это всё не то.. \nА, точно: мААааауу! МАУ, йопт!!!" ; }
    return  $self;
}

return true;
