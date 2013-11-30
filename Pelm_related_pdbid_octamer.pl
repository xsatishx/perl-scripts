open(IN,"phospho3d_pelm-pdb_table.txt");
@data=<IN>;
foreach $data(@data)
	{
		@cols=split(/\,/,$data);
		$pdbid=$cols[4];	
		$pdbid=uc($pdbid);
		$file="$pdbid.pdb"; 
		$resno=$cols[6];
		$res=$cols[3];
unless (-e $file)
		   {
		    system ("wget http://www.rcsb.org/pdb/files/$file");
		   }
		
		open(OUT,">$pdbid.seq");
		open (PDB,"$pdbid.pdb");
		@pdb=<PDB>;
		   foreach $pdb (@pdb)
			   {
				if (($pdb =~m/ATOM/) && ($pdb =~m/CA/))	
				    {
						@residue=substr($pdb,17,4);
						$aa=join('',@residue);
						$res=con(@residue);
						print $res;
						print  OUT $res;
			}
	}
}				
					
sub con {

    $input = $aa;
    
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
            print "";
            next;
        }
        $seq .= $three2one{$code};
    }
    return $seq;
}
