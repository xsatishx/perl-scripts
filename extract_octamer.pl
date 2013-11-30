open(OUT,">phosphorylated_proteins_octamer.csv");
open(IN,"phosphorylated_proteins_reschain_out.csv");

@data=<IN>;
foreach $data(@data)
{
@cols=split(/\,/,$data);
$pdb=$cols[0];
$chain=$cols[3];
$resno=$cols[2];
chomp $cols[1];
$modres=$cols[1];

 open (SEQ,"$pdb$chain.seq");
 @sequence=<SEQ>;
 foreach $sequence(@sequence)
	{
	$position=index($sequence,$modres);
	$position=$position+1;
	$extractf=substr($sequence,$position,4);
	$extractb=substr($sequence,$position-4,4);
	$extract="$extractb$extractf";
	 print "$pdb,$cols[1],$chain,$resno,$extract\n";
	 print OUT "$pdb,$cols[1],$chain,$resno,$extract\n";
		}
}