open(HIT,"phosphorylated_pdb_octamer_ss_formatted.csv");
@data=<HIT>;
foreach $data(@data)
	
	{
	@id= split(/\,/,$data);
	$id[2]=lc($id[2]);
	$in="$id[2].pdb";
	$out="$id[2].out";	
	system("./pops --pdb $in --coarse --residueOut --popsOut $out");
	}
