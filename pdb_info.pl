use WWW::Mechanize;
open(OUT,">MM_results3.csv");
open(IN,"MM_results2.csv");
@data=<IN>;
foreach $line (@data)
{
@cols=split(/\,/,$line);
$pdb = $cols[6];

$mech = WWW::Mechanize->new();
$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.rcsb.org/pdb/files/$pdb.pdb");


	$filebuf = $mech->content();
	@lines=split('\n',$filebuf);
	#foreach $lines(@lines)
	#{
	 if ($lines[0] =~ m/(\d{2}\-[A-Z]{3}\-\d{2})/)
		{
			$date=$1;
			#print "$pdb,$date";
			print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$date,$cols[7]\n";
			print "$cols[0],$cols[1],$cols[2],$date,$cols[3],$cols[4],$cols[5],$cols[6],$date,$cols[7]\n";
		}	
}


