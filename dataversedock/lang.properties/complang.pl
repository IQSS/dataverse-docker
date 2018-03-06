#!/usr/bin/perl

$lang1 = $ARGV[0];
$lang2 = $ARGV[1];

sub readprop
{
    my ($filename) = @_;
    open(f, $filename);
    while (<f>)
    {
	my $s = $_;
	$s=~s/\r|\n//g;
	if ($s=~/^(.+?)\=(.+)$/)
	{
	     $k{$1}++;
	}
#	print "$s\n";
    }
    close(f);

    return %k;
}

%k1 = readprop($lang1);
%k2 = readprop($lang2);

foreach $item (sort keys %k1)
{
#    print "$item\n";
    if (!$k2{$item})
    {
	print "Missing $item\n";
    }
}
