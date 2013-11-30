use WWW::Mechanize;
open (IN,"phosphorylated_proteins.csv");
open (OUT,">phosphorylated_proteins_reschain_out.csv");
@data=<IN>;
	foreach $data (@data)
		{
		 @cols=split(/\,/,$data);
		 $pdb=$cols[0];
		 	$mech = WWW::Mechanize->new();
			$mech->get("http://www.rcsb.org/pdb/files/$pdb.pdb");
			$filebuf = $mech->content();
			#print $filebuf;
				@lines=split(/\n/,$filebuf);
					
					foreach $lines (@lines)
					{
						
						if (($lines =~ m/MODRES/) && (($lines =~ m/SEP/) || ($lines =~ m/TPO/) || ($lines =~ m/PTR/)))  
							{
								$res=substr($lines,12,3);
								$resno=substr($lines,18,4);
								$chain = substr($lines,16,1);
								print "$pdb,$res,$resno,$chain,\n";
								print OUT "$pdb,$res,$resno,$chain\n";
							}
					}
		}
	