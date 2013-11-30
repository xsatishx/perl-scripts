#!/usr/bin/perl
# HITS.dat --->elastase-2,LGPVTPEI,1gen
#A0FGR8,SDISLPIA,2DMG 
#O00139,SPETPPPP,2GRY 


$outputfile= 'looper.csv';
open(REPSASA, ">$outputfile");

open(HIT,"hits.dat");
@entry=<HIT>;
foreach my $entry (@entry) 
{
	my @hitman  = split ('\,',$entry);
	chomp $hitman[2];
     	my @sasa = pops_out_reader ($hitman[2]);			
my $c = '0';        #stores the length of the array sasa
	my $seq;

		foreach my $sasa(@sasa)
		{
		$seq .= $sasa[$c][1];
		$c++;
		}
 
	my $fasta =  iub3to1($seq);
	#print $fasta;
	my $sasasubstrate = 0;
	my $tab	= 0;
	my $next = -1;      
	chomp $hitman[1];
	my @troubleseeker; 		#this array is responsible to see if the octapeptide in the protein is continous
	do{                           #here we locate the sasa for the hits
	     my $position = index($fasta,$hitman[1],$next);
	     $tab = $position +1;

		if ( ($next == -1)& ($tab == 0))
			{
			print REPSASA "$hitman[0],$hitman[1],$hitman[2],$hitman[3],$hitman[4],$hitman[5],$hitman[6],N,N,N,N\n";

			}
		elsif ($tab != 0)	
			{
	     		

			  print REPSASA "$hitman[0],$hitman[1],$hitman[2],$hitman[3],$hitman[4],$hitman[5],$hitman[6]";

			my $rsasasubstrate = 0;
			my @rsasa;
			my $i;
			print REPSASA ",";
			for ($i =0; $i <8; $i++)     #here is the jumper for the entire program
			 {
			  
			  my $k = $i-1;  #k adjusts the value of the counter to start from P4 instead of P3 were it not there 
			  my $j = $i+1;
				if (($tab+$k+1)>$c)
				   { #  print"we found disorder\n";
					print REPSASA "EDGE,";
					last;
			         }
				else
				  {	
				#reporting of sasa
				  $sasa[$tab+$k][2] =~ s/^\s*//;
			  	  $hitman[$j] = $sasa[$tab+$k][2];
			  	  $sasasubstrate += $sasa[$tab+$k][2];
			  	  #filing up the trouble seeker array 
			  	  #print REPSASA "$hitman[$j],";
				
				#reporting of rsasa
#the tripeptide data
my %tripep = (

'ALA'	=>113,			
'VAL'	=>160,	
'LEU'	=>180,	
'ILE'	=>182,	
'PRO'	=>143,	
'TRP'	=>259,	
'PHE'	=>218,	
'MET'	=>204,
'GLY'	=>85,	 
'SER'	=>122,	
'THR'	=>146,	
'TYR'	=>229,	
'CYS'	=>140,	
'ASN'	=>158,	
'GLN'	=>189,	
'LYS'	=>211,
'ARG'	=>241,	
'HIS'	=>194,	
'ASP'	=>151,
'GLU'	=>183,
);
			     	  $sasa[$tab+$k][1] =~ s/\s*$//g;
				  $sasa[$tab+$k][1] =~ s/^\t//g; 
				  $rsasa[$i] = $sasa[$tab+$k][2]	/ ($tripep{$sasa[$tab+$k][1]});
				  $hitman[$j] = $rsasa[$i]; 	
				  $rsasasubstrate += $rsasa[$i];
				  #print REPSASA "$hitman[$j],";	
				}			 
			  	
			}
			#print REPSASA ",";
			$rsasasubstrate = $rsasasubstrate/($i);
			print REPSASA "$rsasasubstrate\n";

		}	
	$next = $tab;
	}while ($next != 0)
}



##############################################################################
#######################SUBROUTINES############################################
##############################################################################


# iub3to1
#
#-change string of 3-character IUB amino acid codes (whitespace separated)
#    into a string of 1-character amino acid codes
#This is a variation from the usual iub3to1 because this returns value X on 

sub iub3to1_A {

    my($input) = @_;
    
    my %three2one = (
      'ALA' => 'A',
      'VAL' => 'V',
      'LEU' => 'L',
      'ILE' => 'I',
      'PRO' => 'P',
      'TRP' => 'W',
      'PHE' => 'F',
      'MET' => 'M',
      'GLY' => 'G',
      'SER' => 'S',
      'THR' => 'T',
      'TYR' => 'Y',
      'CYS' => 'C',
      'ASN' => 'N',
      'GLN' => 'Q',
      'LYS' => 'K',
      'ARG' => 'R',
      'HIS' => 'H',
      'ASP' => 'D',
      'GLU' => 'E',
    );

    # clean up the input
    $input =~ s/\n/ /g;
    $input = uc ($input); # A trivial addition to the original program	
    my $seq = '';
    
    # This use of split separates on any contiguous whitespace
    my @code3 = split(' ', $input);

    foreach my $code (@code3) {
        # A little error checking
        if(not defined $three2one{$code}) {
            $seq = 'X';                        #this is the extra step in the program
		#print "Code $code not defined\n";
            next;
        }
        $seq .= $three2one{$code};
    }
    return $seq;
}


#this subroutine reads the .out files generated for a POPs

sub pops_out_reader
{

my @stupid = @_;

use strict;
use warnings;
use BeginPerlBioinfo;

my $input = join('',@stupid);
$input=lc($input);
$input .= '.out';

my @file = get_file_data($input);

for (my $i=0; $i<4; $i++)
{
shift @file;
}

for (my $i=0; $i<7; $i++)
{
pop @file;
}

my $count = '0';
my @final;

foreach my $filerecord(@file)
{
$final[$count][0] = substr($file[$count], 0, 8);
$final[$count][1] = substr($file[$count], 8, 4);
$final[$count][2] = substr($file[$count], 34,11);

$count++;
}
return @final;
}

