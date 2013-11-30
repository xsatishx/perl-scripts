open(IN,"pdblist");
@data=<IN>;
	foreach $data(@data)
	{
	@cols=split(/\,/,$data);
	$pdb=$cols[0];
	$pdb=lc($pdb);

open (FILE1,"$pdb.dssp");
my @filebuf = <FILE1>;
my $filebuf = join("",@filebuf);
$filebuf =~ s{(.+?(?=\#)(.*))}
	     {
	     	my $data = $2;
	     	open (FILE2,">$pdb.dssp");
	     	print FILE2 "$data";
		print "$data";
	     
	     }exgsi;

	}
