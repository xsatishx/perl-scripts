use WWW::Mechanize;
open(OUT,">mathiasmann_resultsasa_less0.31_pdbdetails2.csv");
open(IN,"mathiasmann_resultsasa_less0.31_pdbdetails.csv");
@data=<IN>;
foreach $line (@data)
{
@cols=split(/\,/,$line);
$pdb = $cols[2];
chomp $cols[7];
chomp $cols[8];

$mech = WWW::Mechanize->new();
$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.rcsb.org/pdb/files/$pdb.cif");

#
	$filebuf = $mech->content();
	@lines=split('\n',$filebuf);
	foreach $lines(@lines)
	{
	 if ($lines =~ m/_pdbx_struct_assembly.oligomeric_details/)
		{
			$mer=substr($lines,43,20);
			
			print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$cols[7],$cols[8],$mer\n";
			print "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$cols[7],$cols[8],$mer\n";
		}
	}

}
