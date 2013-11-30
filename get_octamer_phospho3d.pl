open(OUTPUT,">Phospho3d_octamer.csv");
open(INPUT,"phospho3d_pelm-pdb_table.txt");
@input = <INPUT>;
	foreach $input (@input)
	{
	    @data=split(/\,/,$input);
	    $uniprot=$data[1];
	    $file="$uniprot.fasta";	
	    unless (-e $file)
	    {
	    system ("wget http://www.uniprot.org/uniprot/$file");
	}		
	 open(SEQ,"$uniprot.fasta");
			  @sequences=<SEQ>;
			  ($fasta,@sequences) = @sequences;       # remove the first element of @fred to $e
              		  $sequence= join('',@sequences);
			  chomp($sequence);
			  $sequence=~ s/\n//g;
			  $pos=$data[2];
			  $end=8-$pos;
			  if ($pos <4 )
			  {
			  $front=substr($sequence,0,$pos);
			  $back=substr($sequence,$pos,$end);
			  $seq="$front$back";
			  }
			  else
			  {
			  $front=substr($sequence,$pos-4,4);
			  $back=substr($sequence,$pos,4);
			  $seq="$front$back";
			  }
			 print OUTPUT "$data[1],$seq,$data[4],$data[2],$data[3],$data[5],$data[6],$data[7],\n";
			 print "$data[1],$seq,,$data[4],$data[2],$data[3],$data[5],$data[6],$data[7],$seq\n";
	}

