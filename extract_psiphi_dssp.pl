open (IN,"pdb_phosphorylated_ss_rsasa_oct1.csv");
@data=<IN>;
foreach $data(@data)
	{
	 @cols=split(/\,/,$data);
	 $pdb=$cols[1];
	 $resnum=$cols[2];
	 $res=X;

			open(OUT,">>pdb_phosphorylated_rSASA_ss_PsiPhi.csv");
			open(PDB,"$pdb.csv");
			@dsspdata=<PDB>;
			
			foreach $dsspdata(@dsspdata)
				{
				@pdbcols=split(/\,/,$dsspdata);
				$dsspresnum=$pdbcols[0];
				$dsspres=$pdbcols[1];
				$phi=$pdbcols[2];
				$psi=$pdbcols[3];
				
					##to get the residue numbers of octapeptide##
					$resnum1= $resnum-3;
					$resnum2= $resnum-2;
					$resnum3= $resnum-1;
					$resnum4= $resnum;
					$resnum5= $resnum+1;
					$resnum6= $resnum+2;
					$resnum7= $resnum+3;
					$resnum8= $resnum+4;
					###Above line gets the octapeptide residue numbers ###
					
					if (($dsspresnum eq $resnum1) || ($dsspresnum eq $resnum2) || ($dsspresnum eq $resnum3) || ($dsspresnum eq $resnum4) || ($dsspresnum eq $resnum5) || ($dsspresnum eq $resnum6) || ($dsspresnum eq $resnum7) || ($dsspresnum eq $resnum8))
						{
							print "$pdb,$res,$resnum,$cols[3],$cols[4],$cols[5],$dsspresnum,$dsspres,$phi,$psi,\n";
							print OUT "$pdb,$cols[0],$resnum,$cols[3],$cols[4],$cols[5],$dsspresnum,$dsspres,$phi,$psi,\n";
						}
				
				}
	}