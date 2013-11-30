use WWW::Mechanize;
open(OUT,">kinasephos_swissprot_pdb.csv");
open(IN,"kinasephos_swissprot.csv");
@data=<IN>;
foreach $line (@data)
{
@cols=split(/\,/,$line);
$uniprot = $cols[0];
chomp $cols[3];

$mech = WWW::Mechanize->new();
$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.uniprot.org/uniprot/$uniprot.txt");

	$filebuf = $mech->content();
	@lines=split('\n',$filebuf);
	foreach $lines(@lines)
	{
	 if ($lines =~ m/DR   PDB;/)
		{
			$res=substr($lines,10,4);
			
			print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$res,\n";
			print "$cols[0],$cols[1],$cols[2],$cols[3],$res,\n";
		}
	}

}
