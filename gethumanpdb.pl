open(IN,"try_human.csv");
@data=<IN>;
#print @data;
foreach $data(@data)
{
@lines = split('\,',$data);
chomp $lines[2];
$ids= "$lines[2].pdb";
	open (PDB,"$ids");
	@pdb=<PDB>;
	foreach my $pdb (@pdb)
	{
				   if ($pdb =~ m/HOMO SAPIENS/) 
					{
					 print "$lines[1],$lines[2],$lines[3],$lines[4],$lines[5],$lines[6]";
					}
	} 

	
}