open (OUT,">phosphorylated_pdb_octamer_ss_formatted.csv");
open (IN,"phosphorylated_pdb_octamer_ss.csv");
@data= <IN>;
 foreach $data(@data)
	{
	 @cols=split(/\,/,$data);
		print OUT "$cols[1],$cols[5],$cols[0],$cols[2],$cols[3],$cols[4],$cols[6],\n";
	}
