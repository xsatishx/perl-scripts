#works for a list of fasta sequences saved in a file seq.fasta

open (IN,"try.txt");
@data=<IN>; 

    foreach  $line(@data) 

{

       if ($line =~ /^\s*$/)
	 {
            next;
         } 
		elsif($line =~ /^\s*#/) 
	{
            next;
	} 
		elsif($line =~ /^>/) 
		{
        	 next;
	        } 
		else
		 {
            $sequence .= $line;
        	}
    }

    # remove non-sequence data (in this case, whitespace) from $sequence string
    $sequence =~ s/\s//g;

    print $sequence;
