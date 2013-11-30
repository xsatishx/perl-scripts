open(MAIN,"mathiasmann_resultsasa_DO.csv");

@data=<MAIN>;
open(OUTS,">mathiasmann_resultsasa_DO_validated.csv");
foreach $line (@data)
{
@cols=split(/\,/,$line);

chomp $cols[6],$cols[2],$cols[1];
$pdb = $cols[2];
$pattern=$cols[1];

	open(SEQ,"$pdb.out");
	@sequence =<SEQ>;
foreach (@sequence)
    {
		if ($_=/$pattern/)
		{
		print OUTS "$cols[0],$cols[1],$pdb,$cols[3],$cols[4],$cols[5],$cols[6],$pattern,present\n" ;
		}
			else
			{
			print OUTS "$cols[0],$cols[1],$pdb,$cols[3],$cols[4],$cols[5],$cols[6],$pattern,absent\n" ;
			}
	}
}