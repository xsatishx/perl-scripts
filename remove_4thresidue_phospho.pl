open(OUT,">phosphorylated_proteins_septamer.csv");
open(IN,"phosphorylated_proteins_octamer.csv");
@data = <IN>;
foreach $data(@data)
	{
	 @cols=split(/\,/,$data);
         $octa=$cols[4];
	 $back=substr($octa,0,3);
	 $front=substr($octa,4,4);		 
	 $res="$back$front";
	print OUT "$cols[0],$cols[1],$cols[2],$cols[3],$octa,$res,\n";
	}
