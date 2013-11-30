open (IN,"pdb_phosphoprot_relatedid.csv");
open (OUT,">pdb_phosphoprot_relatedid_OUT.csv");
@data= <IN>;
	foreach $data (@data)
	{
		@cols=split(/\,/,$data);
		$pdb=$cols[4];
		
		




       }
