open(INPUT,"uniprotidlist.csv");
@ids=<INPUT>;
foreach $id (@ids)
{
#print $id;
chomp $id;
chop $id;
system ("wget http://www.uniprot.org/uniprot/$id.fasta");
}