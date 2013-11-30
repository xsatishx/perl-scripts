open(IN,"kinasephos_swissprot.csv");
#open(OUT,">unilist.csv");
@list=<IN>;
foreach $list(@list)
	{
	@uniprot = split(/\,/,$list);
	print "$uniprot[0]\n";
	$fileid="$uniprot[0].txt";
	unless (-e $fileid)
		{
		system ("wget http://www.uniprot.org/uniprot/$fileid"); 	
		}
	}	
