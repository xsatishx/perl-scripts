open (LIST,"list");
@list=<LIST>;
foreach $list(@list)
{
 @id=split(/\,/,$list);
 $pdb=$id[0];
 $pdbid = "$pdb.pdb";

	open (IN, "$pdbid");
	@atom=<IN>;
	open (OUT,">$pdbid");
	foreach $atom(@atom)
		{
	 	$residue = substr($atom,17,3);
	 	if (($residue ne " DA") && ($residue ne " DC") && ($residue ne " DT") && ($residue ne " DG") && ($residue ne " DU"))
			{ 
			print $atom;
			print OUT $atom;
			}	
		}
}
