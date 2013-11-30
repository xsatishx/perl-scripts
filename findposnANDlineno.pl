$file =$ARGV[0];
$pattern=$ARGV[1];
open(FILE1,"$file");
my @filebuf = <FILE1>;
$length= @filebuf;
$line=0;
while ($line<$length)
{	
	$lineo=$line+1;
	$text=$filebuf[$line];
	chomp $text;
	$offset=0;
	$result=index($text,$pattern,$offset);
		 while ($result != -1)
	    {
    	print "jyoti found at position $result in line $lineo in $file\n";
        $offset = $result + 1;
        $result = index($text, $pattern, $offset);
	    }
 $line++;
}
close (FILE1);