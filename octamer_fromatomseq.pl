open(INPUT,"phospho3d_pelm-pdb_table.csv");
@input = <INPUT>;
	foreach $input (@input)
	{
	    @data=split(/\,/,$input);
		$pdb=$data[3];
		$chain=$data[4];
		$resno=$data[5];
		$resnob=$resno-4;
		$pdb=uc($pdb);
		$file="$pdb$chain.seq";
		open(SEQ,"$file");
		$sequences=<SEQ>;
		$front =substr($sequences,$resno,4);
		$back=substr($sequences,$resnob,4);
		$octamer="$back$front";
		print "$pdb,$chain,$resno,$octamer,$data[2] \n";
	}
		