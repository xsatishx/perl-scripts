#program to get uniprot sequences and print it into csv file #of selected uniprot ids.
open(INPUT,"mathiasmann_finaldata.csv");
open(OUTPUT,">mathiasmann_with_uniprotSEQ.csv");
@input = <INPUT>;
	foreach $input (@input)
	{
	    @data=split(/\,/,$input);
	    $data[1]=~ s/ +\n//g; 	#uniprot id
			 open(SEQ,"$data[1].fasta");
			  @sequences=<SEQ>;
			  ($fasta,@sequences) = @sequences;       # remove the first element of @fred to $e
              $sequence= join('',@sequences);
			  chomp($sequence);
			  $sequence=~ s/\n//g;
			  $pos=$data[4];
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
			 print OUTPUT "$data[0],$data[1],$data[2],$data[3],$data[4],$seq\n";
			 print "$data[0],$data[1],$data[2],$data[3],$data[4],$seq\n";
	}