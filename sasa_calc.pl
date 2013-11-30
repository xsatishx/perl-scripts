open(HIT,"list");
@data=<HIT>;
foreach $data(@data)
	
	{
	@id= split(/\,/,$data);
	$pdb=$id[0];
	$in="$pdb.pdb";
	$out="$pdb.out";
	system ("./pops --pdb $in --residueOut --coarse --popsOut $out");
	}
