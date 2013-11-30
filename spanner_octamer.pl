my $cntT = 0;
my $cntY = 0;
my $cntS = 0;
my $cntE = 0;
my $cntP = 0;
my $total=0;
open (OUT,">sequence_spanned.csv");
open (IN,"sequence");
@sequence=<IN>;
$sequence=join(//,@sequence);
$sequence =~ s/\n//g;
print "$sequence\n";

	$length= length($sequence);

	for ($count=0;$count<$length;$count++)
	{
	$octamer=substr($sequence,$count,8);
	$ret_val=counter($octamer);
	}


sub counter
{	
	my ($var) = @_[0];	
	@var = split(//,$var);	
	    foreach $var(@var)
	    {
		if ($var =~ m/T/gs)
			{
			$cntT++;
			$total++
			}	
			elsif ($var =~ m/Y/gs)
				{
				 $cntY++;
				 $total++
				}
				elsif ($var =~ m/S/gs)
					{
				 	$cntS++;
					$total++
					}
					elsif ($var =~ m/E/gs)
						{
				 		$cntE++;
						$total++
						}
						elsif ($var =~ m/P/gs)
							{
						 	$cntP++;
							$total++
							}
		
	  }
	
	print "$octamer,T:$cntT,Y:$cntY,S:$cntS,E:$cntE,P:$cntP,Total:$total\n";
	print OUT "$octamer,T:$cntT,Y:$cntY,S:$cntS,E:$cntE,P:$cntP,Total:$total\n";
	$cntT = ();
	$cntY = ();
	$cntS = ();
	$cntE = ();
	$cntP = ();
	$total= ();
	return $var	
}
