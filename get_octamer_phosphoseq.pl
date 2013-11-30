open(IN,"kinasephos_swissprot_pdb.csv");
open(OUT,">kinasephos_swissprot_pdb_octamer.csv");
@data=<IN>;
foreach $data(@data)
	{
  	 @phosresidue = split(/\,/,$data);
	 $sequence=$phosresidue[3];
	 $front= substr($sequence,11,4);
	 $back=substr($sequence,7,4);
	 $octamer="$back$front";
	 print OUT "$phosresidue[0],$phosresidue[1],$phosresidue[2],$phosresidue[4],$sequence,$octamer\n";
	}
