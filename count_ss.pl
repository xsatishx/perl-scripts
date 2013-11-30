my $cntT = 0;
my $cntH = 0;
my $cntB = 0;

open(OUT, ">phosphorylated_pdb_octamer_ss_propensity.csv");

open (FILE,"phosphorylated_pdb_octamer_ss.csv");
my @filebuf = <FILE>;

foreach $lines (@filebuf)
	{
	 @cols=split(/\,/,$lines);
	 $ss = $cols[5];
	 $ret_val=counter($ss);
	}

###################################sub-routine############################################

sub counter
{	
	my ($var) = @_[0];	
	@var = split(//,$var);	
	foreach $var(@var)
	{
		if ($var =~ m/T/gs)
			{
			$cntT++;
			}	
			elsif ($var =~ m/H/gs)
				{
				 $cntH++
				}
				elsif ($var =~ m/B/gs)
					{
				 	$cntB++
					}
	}
	print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cntT,$cntH,$cntB,\n";
	print "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cntT,$cntH,$cntB,\n";
	$cntT = ();
	$cntH = ();
	$cntB = ();
	return $var	
}
