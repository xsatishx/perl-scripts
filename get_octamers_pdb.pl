
open(INPUT,"phospho3d_pelm-pdb_table.csv");
@input = <INPUT>;
	foreach $input (@input)
	{
	    @data=split(/\,/,$input);
		$pdb=$data[3];
		$chain=$data[4];
		$resno=$data[5];
				$resnob=$resno-4;
		$pdb=uc($pdb);
		$file="$pdb.pdb";
			open(OUTPUT,">$pdb$chain.seq");
			open(SEQ,"$file");
			@sequences=<SEQ>;
				foreach $sequence(@sequences)
				{
				
					if (($sequence =~ m/ATOM/) && ($sequence =~ m/$chain/) && ($sequence =~ m/CA/)) 
							{
								$residue=substr($sequence,17,3);
								$oneResidue= con($residue);
								print $oneResidue;
								print OUTPUT $oneResidue;
							}
				}
	}

			
sub con {

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

    # clean up the input
    $input =~ s/\n/ /g;

    my $seq = '';
    
    # This use of split separates on any contiguous whitespace
    my @code3 = split(' ', $input);

    foreach my $code (@code3) {
        # A little error checking
        if(not defined $three2one{$code}) {
            #print "";
            next;
        }
        $seq .= $three2one{$code};
    }
    return $seq;
}
