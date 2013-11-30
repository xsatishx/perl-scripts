open(IN,"phosphoELM_0409");
open(OUT,">phosphoELM_out.csv");
@data=<IN>;
#print @data;
foreach $data(@data)
{
@lines = split('\\t',$data);
print OUT "$lines[0],$lines[2],$lines[3],$lines[4],$lines[5],$lines[6]\n";
}