open(IN,"pdblist");
@data=<IN>;
foreach $data(@data)
{
	@cols=split(/\,/,$data);
	$pdb=$cols[0];
	$pdb=lc($pdb);

		open (FILE,"$pdb.dssp");
		open (OUT,">$pdb.csv");

	@contents= <FILE>;
	foreach $contents (@contents)
	{
	#$print= substr($contents,0,14);
	$resno=substr($contents,7,3);
	$residue=substr($contents,13,1);
	$phi=substr($contents,103,6);
	$psi=substr($contents,109,6);
	$result="$resno,$residue,$phi,$psi\n";
	$result=~ s/\s+/,/g;
	$result=~ s/,,/,/g;
	print "$result\n";
	print OUT "$result\n";
	}
}
