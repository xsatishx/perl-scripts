open (IN,"phosphorylated_proteins_octamer_use.csv");
@data=<IN>;
open (OUT,">phosphorylated_disordered.csv");
foreach $data(@data)
	{
	@cols=split(/\,/,$data);
	$pdb=$cols[0];
	$pdb=lc($pdb);
	$pdbid="$pdb.pdb";
	$chain=$cols[2];
	$resno=$cols[3];
				open (PDB,"$pdbid");
				@lines = <PDB>;
				#@lines=split(/\n/,$filebuf);
					foreach $lines (@lines)
					
					{
						if (($lines =~ m/REMARK 470/) && ($lines =~ m/$chain/) && ($lines =~ m/$resno/))
						{
							$res=substr($lines,15,3);
							print OUT"$pdb,$res,$chain,$resno,$cols[4],disordered\n";
						}
							
					}
	}

