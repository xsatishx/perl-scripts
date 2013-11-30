open(IN,"pdblist");
@data=<IN>;
	foreach $data(@data)
	{
	@cols=split(/\,/,$data);
	$pdb=$cols[0];
	$pdb=lc($pdb);
	system ("./dsspcmbi -na $pdb.pdb $pdb.dssp");
	}
