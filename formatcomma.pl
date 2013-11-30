open(INPUT,"mathiasmann_finaldata.csv");
open(OUTPUT,">mathiasmann_finaldata_good.csv");

@input = <INPUT>;
	foreach $input (@input)
	{
	    	@data=split(/\,/,$input);
		print OUTPUT "$data[0],$data[1],$data[2],$data[3],$data[4],"
	}
