use WWW::Mechanize;
open (OUT,">pdb_phos_nonphos.csv");
open(IN,"pdb_phosphoprot_relatedid.csv");
@data=<IN>;
	foreach $data (@data)
	{
		@cols=split(/\,/,$data);
		$pdbid=$cols[4];
		$modres=$cols[1];
		$resno=$cols[2];
		$mech = WWW::Mechanize->new();
		$mech->get("http://www.rcsb.org/pdb/files/$pdbid.pdb");
		$filebuf = $mech->content();
		@lines=split('\n',$filebuf);
		foreach $lines(@lines);
			{
				if (($lines = ~m/MODRES/) && ($lines = ~m/$modres/) && ($lines = ~m/$resno/))
					{
					  print "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],yes\n";
					  print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],yes\n";
					}
			}
	}
