open(RESULT,"phosphorylated_proteins_octamer_use.csv");
@data=<RESULT>;
open (OUT,">phosphorylated_pdb_octamer_ss.csv");
foreach $data(@data)
{
@cols = split(/\,/,$data);
$pdb=$cols[0];
$pdb=lc($pdb);
$sequence=$cols[5];
$file="$pdb.pdb";

#unless (-e $file)
#{
#system ("wget http://www.rcsb.org/pdb/files/$file");
#}
system ("stride -o $pdb.pdb > $pdb.stride");
#system ("chmod a+x *.pdb");
#system ("chmod a+x *.out");

open(IN,"$pdb.stride");
@stridereport = <IN>;
   
    @seq = grep(/^SEQ /, @stridereport);
    @str = grep(/^STR /, @stridereport);

	   for (@seq) { $_ = substr($_, 10, 50) }
	   for (@str) { $_ = substr($_, 10, 50) }

    $seq = join('', @seq);
    $str = join('', @str);
    $seq =~ s/(\s+)$//;
    $length = length($1);
    $str =~ s/\s{$length}$//;
    
	$finder=index($seq,$sequence);
	$residue=substr($seq,$finder,8);
	$ss=substr($str,$finder,8);

print "$cols[0],$cols[1],$cols[3],$cols[4],$cols[5],$residue,$ss,\n";
print OUT "$cols[0],$cols[1],$cols[3],$cols[4],$cols[5],$residue,$ss,\n";
}

