open (IN,"3ZTJ.pdb");
@data = <IN>;

$count =0 ;
	
	foreach $data (@data)
		{
		 $count++;
		 
			if (($data =~ m/COMPND/) && ($data =~ m/ANTIBODY/))
				{
				  $required = $data[$count];
				  $chains = substr($required,18,26);
				  $chains =~ s/\,//g;
				  print $chains;		  
		 		}
		
		}
		
		
		$mycode = split ($var,2,12);
		if (split($var,14,6))
		
		
    