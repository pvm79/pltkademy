#!/bin/bash
#Script that creates #var1 files filled with #var2 random characters.
var1=10
var2=1000
   for ((i=0; i<$var1; i=i+1))
   do 
	  openssl rand -base64 737  > random_text_$i.txt
	  
   done

