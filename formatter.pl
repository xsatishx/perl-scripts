open(IN,"kinasephos_swissprot_pdb_octamer.csv");
open(OUT,">kinasephos_hits.csv");
@list=<IN>;
	foreach $data(@list)
	{
	 @cols = split(/\,/,$data);
	 $uniprot=$cols[0];
	 $phosno=$cols[1];
	 $phosres=$cols[2];
	 $pdbid=$cols[3];
	 $seq=$cols[4];
	 $octamer=$cols[5];
	 chomp ($seq);
	 chomp ($octamer);
	 $octamer=~ s/\r//g;
		print OUT "$uniprot,$octamer,$pdbid,$phosno,$phosres,$seq,\n";
		print "$uniprot,$octamer,$pdbid,$phosno,$phosres,$seq,\n";	
	}
