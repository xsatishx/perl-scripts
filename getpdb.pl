open(IN,"kinasephos_swissprot_pdb_octamer.csv");

@data=<IN>;
foreach $data(@data)
	{
	 @cols = split(/\,/,$data);
		$file="$cols[3].pdb";
		 unless (-e $file)
		   {
		    system("wget http://www.rcsb.org/pdb/files/$cols[3].pdb");
		   }
	}
