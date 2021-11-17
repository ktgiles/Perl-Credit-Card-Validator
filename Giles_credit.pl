
#Kaitlin Giles
#Perl script to parse user input, validate credit card number
#(16 digits, only spaces and/or dashes allowed)
#print error message or 4 groups of 4 digits seperated by newlines

#!/usr/bin/perl

@digitlist; #empty list to hold digits
$count = 0;
$errormessage = 0; #will prevent error message from duplicating
$error = "Entry must be exactly 16 digits and contain only digits, dashes, and spaces. \n"; 

print "Please enter a credit card number:";
chomp($inp = <>);

foreach $char (split //, $inp) {
	if ($char =~ /\d/) {
		push(@digitlist, $char);
		$count++;
		if ($count > 16) { #ends program if more than 16 digits entered
			print "$error";
			print "You entered too many digits. \n";
			print "You entered: $inp";
			$errormessage++;
			last;
		}
	}
	elsif ($char =~ /\s/ || $char =~ /\-/) {
		#ignore it, do nothing
	}

	else { #if input contains anything other than digits, spaces, and dashes
		print "$error";
		print "Your entry contained something other than digits, spaces, and dashes. \n";
		print "You entered: $inp";
		$errormessage++;
		last;
	}	
}

#put all this in bigger conditional so it doesn't run if error message has already tripped


if ($errormessage =~ 0) { #prevents duplicate error message
	if ($count < 16) { #validates that exactly 16 digits were entered
		print "$error";
		print "You did not enter enough digits. \n";
		print "You entered: $inp";
	}
	else { #at this point entry has been validated and 16 digits placed in @digitlist
		$digitstring = join('', @digitlist);
	}
}

my @quads = $digitstring =~ /..../sg; 

print join("\n", @quads), "\n";
