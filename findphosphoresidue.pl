use WWW::Mechanize;

open(IN,"mathiasmann_resultsasa_DO_PDBID.csv");
@data=<IN>;
open(OUTTER,">mathiasmann_resultsasa_DO_phosphorylated.csv");
foreach $line (@data)
{
	@cols=split(/\,/,$line);
	chomp $cols[0];
	$pdb = $cols[0];
	print "$pdb,";
	$mech = WWW::Mechanize->new();
	$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
	$mech->get("http://www.rcsb.org/pdb/files/$pdb.pdb");
	$filebuf = $mech->content();
		@lines=split('\n',$filebuf);
			foreach $lines(@lines)
			{
				if (($lines =~ m/MODRES/) && ($lines =~ m/PHOSPHO/)) 
				{
				print OUTTER "$cols[0],phosphorylated\n";
				print "$cols[0],phosphorylated\n";
				}
			 next;		
			}
}