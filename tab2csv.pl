open(IN,"Swiss_phos_exp.tab");
open(OUT,">kinasephos_swissprot.csv");
@data=<IN>;
#print @data;
foreach $data(@data)
{
@lines = split('\\t',$data);
chomp $lines[3];
$line[3]= ~s/\r//g;
print OUT "$lines[0],$lines[1],$lines[2],$lines[3],\n";
}
