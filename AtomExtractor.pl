#Gets the atom records only from the pdb file . Can be modified easily to print the co-ordinates only #

if ($#ARGV < 0) {
        print STDERR "usage: $0 <pdbfile> \n";
        exit -1;
}

$protname 	   = $ARGV[0];
open (IN, "$protname");
@data 		   = <IN>;

#print @data;
 foreach $data (@data)
 {
  if (($data   =~ m/^ATOM/) || ($data =~ m/^TER/))
	{
	print $data;
	
	### Uncomment the Below code if you just want to print the cordinates only ###
	#@contents = split(/\s+/,$data);
	#print "$contents[6] \t $contents[7] \t $contents[8]\n";
	}
}