use WWW::Mechanize;
$mech = WWW::Mechanize->new();
#$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.rcsb.org/pdb/files/2l3x.pdb");

	$filebuf = $mech->content();
	@lines=split('\n',$filebuf);
	foreach $lines(@lines)
	{
	 if ($lines =~ m/EXPERIMENT TYPE/)
		{
			$res=substr($lines,44,25);
			
			print "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$cols[7],$res\n";
		}
	}

