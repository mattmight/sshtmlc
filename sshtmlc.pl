#!/usr/bin/perl

# sshtmlc: statically includes server-side includes
# takes a file on STDIN and sends the expanded file to STDOUT

# WARNING: This only supports the directive <!--#include file="[file name]" -->
# WARNING: This will not work if there are multiple include directives on the same line.

use strict;
use warnings;


while (my $line = <STDIN>) {

   # Check to see if the line contains <!--#include file="[file name]" -->

   #  WARNING: this will fail on filenames that contain " (properly escaped)
   my @matches = ($line =~ /(.*)<!--#include[ ]+file=["]([^"]+)["][ ]*-->(.*)/) ;

   if (@matches) { 

     # Grab the match prior to the tag; the filename; and the match after the tag:
     my ($before,$filename,$after) = @matches ;

     print $before;

     # Open the included file and print it out:
     open (my $filehandle, "<", $filename) 
      or die "could not open included file: $filename" ;

     while (my $innerline = <$filehandle>) {
       print $innerline ;
     }

     print $after; 

   } else {
     # If no include tag, print out the line, unaltered;
     print $line ;
   }
}
