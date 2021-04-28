#!/bin/bash
if [[ "$1" == "" ]]
then
	echo "Pass either 32 or 64 as the first variable based on the chip architecture"
        exit
fi
if [[ "$1" == "64" ]]
then
	echo "At present, the install doesn't run on 64 bit systems"
	exit
else
	pat="/usr/lib"
fi
while read vers
do
                loc=$(find "$vers/site_perl" -maxdepth 2 -mindepth 2 -type d)
                if test -e "$loc/auto/Intersys"
                then
			echo "Perl libraries already exist"
                else
			echo "Installing Perl libraries"
                        cd /usr/local/cache-perl/dev/perl
                        perl Makefile.PL /usr/cache-perl
                        make
                        make install
                fi
done <<< "$(find "$pat" -maxdepth 1 -mindepth 1 -type d -name "perl*")"
