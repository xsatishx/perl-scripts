open(IN,"phosphorylated_proteins_reschain_out.csv");
@data=<IN>;
foreach $data(@data)
{
@cols=split(/\,/,$data);
$pdb=$cols[0];
$chain=$cols[3];
#$name="$pdb_$chain";			 
				    open (SEQ,">$pdb$chain.seq");
				    open (PDB,"$pdb.pdb");
					@lines=<PDB>;
					foreach $lines (@lines)
					{
						if (($lines =~ m/SEQRES/)&& ($lines =~ m/$chain/)) 
							{
								$seq=substr($lines,19,52);
								$sequence= con($seq);
								print SEQ $sequence;
								print $sequence;
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
	  'SEP' => 'Z',
	  'PTR' => 'X',
	  'TPO' => 'O',
    );

    # clean up the input
    $input =~ s/\n/ /g;

    my $seq = '';
    
    # This use of split separates on any contiguous whitespace
    my @code3 = split(' ', $input);

    foreach my $code (@code3) {
        # A little error checking
        if(not defined $three2one{$code}) {
            print " ";
            next;
        }
        $seq .= $three2one{$code};
    }
    return $seq;
}
