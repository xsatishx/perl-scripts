use WWW::Mechanize;

open(IN,"mathiasmann_resultsasa_DO_PDBID.csv");
@data=<IN>;
foreach $line (@data)
{
@cols=split(/\,/,$line);
$pdb = $cols[0];
open(OUT,">$pdb.out");
$mech = WWW::Mechanize->new();
$mech->proxy(['http', 'ftp'], 'http://10.100.15.3:8080/');
$mech->get("http://www.rcsb.org/pdb/files/$pdb.pdb");
$filebuf = $mech->content();
@lines=split('\n',$filebuf);
	foreach $lines(@lines)
	{
	 if ($lines =~ m/SEQRES/) 
		{
					$seqres= substr($lines,15,50);
					$sequence=oneletter($seqres);
					print OUT $sequence;
					print $sequence;
		}	
	}
}

sub oneletter {

    my($input) = @_;
    
    my %three2one = (
      'ALA' => 'A',
      'VAL' => 'V',
      'LEU' => 'L',
      'ILE' => 'I',
      'PRO' => 'P',
      'TRP' => 'W',
      'PHE' => 'F',
      'MET' => 'M',
      'GLY' => 'G',
      'SER' => 'S',
      'THR' => 'T',
      'TYR' => 'Y',
      'CYS' => 'C',
      'ASN' => 'N',
      'GLN' => 'Q',
      'LYS' => 'K',
      'ARG' => 'R',
      'HIS' => 'H',
      'ASP' => 'D',
      'GLU' => 'E',
    );
    $input =~ s/\n/ /g;

    my $seq = '';
    my @code3 = split(' ', $input);
		foreach my $code (@code3) 
			{
			$seq .= $three2one{$code};
			}
			return $seq;
}
