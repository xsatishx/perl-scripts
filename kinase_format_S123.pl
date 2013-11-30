#IPI00000049,P50591.1,1D0G,MILRTSEETI(p)S(p)TVQEK,T102 S101 ,106,91
#formats it to
#IPI00000049,P50591.1,1D0G,MILRTSEETI(p)S(p)TVQEK,T102,106,91
#IPI00000049,P50591.1,1D0G,MILRTSEETI(p)S(p)TVQEK,S101 ,106,91

#open(OUT,">mathiasmann_finaldata.csv");	
open(FILE,"mathiasman_map_noreapts1.csv");
@data=<FILE>;

	foreach $data (@data)
	{
	@cols=split(/\,/,$data);
	$resnum= $cols[4];
	$resnum=~ s/[A-Z]//g;
	@indres=split(/ /,$resnum);
	$length=scalar(@indres);
		for ($count=0;$count<=$length;$count++)
		{
		print "$cols[0],$cols[1],$cols[2],$cols[3],$indres[$count]\n";
		#print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$indres[$count]\n";
		}
    }
