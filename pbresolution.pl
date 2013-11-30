use WWW::Mechanize;
open(OUT,">MM_results5.csv");
open(IN,"MM_results4.csv");
@data=<IN>;
foreach $line (@data)
{
@cols=split(/\,/,$line);
$pdb = $cols[7];
chomp $cols[9];
$mech = WWW::Mechanize->new();
$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.rcsb.org/pdb/files/$pdb.pdb");
$filebuf = $mech->content();

@lines=split('\n',$filebuf);
	foreach $lines(@lines)
	{
	 if ($lines =~ m/REMARK   2 RESOLUTION./)
		{
			$res=substr($lines,26,4);
			
			print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$cols[7],$cols[8],$res,$cols[9]\n";
			print     "$cols[0],$cols[1],$cols[2],$cols[3],$cols[4],$cols[5],$cols[6],$cols[7],$cols[8],$res,$cols[9]\n";
		}
	}
}