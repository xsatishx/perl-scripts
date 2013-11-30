open(FILE1,"gigi_pdbout.csv");
open(FILE2,"gigi_octamer.csv");
open(OUT,">gigi_uni_pdb_octamer.csv");
@FILE1=<FILE1>;
@FILE2=<FILE2>;

	foreach $a(@FILE1)
	{
	@contenta = split('\,',$a);
	$uniprota=$contenta[0];

		foreach $b(@FILE2)
		{
		@contentb = split('\,',$b);
		$uniprotb=$contentb[0];

			if ($uniprota eq $uniprotb) 
			{
			print OUT "$contenta[0],$contenta[1],$contenta[2],$contentb[1],$contentb[2],$contentb[3],\n";
			print "$contenta[0],$contenta[1],$contenta[2],$contentb[1],$contentb[2],$contentb[3],\n";
			}		
			
		}
	}
