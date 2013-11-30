open(IN,"list");
open(OUT,">kinasephos_swissprot_uni.csv");
@list=<IN>;
foreach $list(@list)
	{
	@uniprot = split(/\,/,$list);
	$uniprotid=$uniprot[0];
	open (FILE,"$uniprotid.txt");
	 @files= <FILE>;
		foreach $file(@files)
		{
			 if ($file =~ m/ID   /) 
			{
			$uniid = substr($file,6,15);
			#$uniid= ~s/ +//g;
			print "$uniprot[0],$uniid,\n";
			print OUT "$uniprot[0],$uniid,\n";
			}
		   	
		
		}  
	}
