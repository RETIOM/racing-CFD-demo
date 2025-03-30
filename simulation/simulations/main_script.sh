#!/bin/bash

function log () {
	if [ -n "$1" ];
	then
		IN=$1;
	else 
		read IN;
	fi;

	if [ -n "$IN" ];
	then
		echo "`date +"[%F %X]"` $IN" >> logs
	fi;
}

if [ `ls -l *.sim | wc -l 2> /dev/null` -gt 0 ];
then
	# Iterate through all .sim files
	for file in *.sim
	do
		# For each file create a folder, name of which is the .sim file's name
		# Change TI to your folder name(do so in PP.java too.)
		file_path=/net/pr2/projects/plgrid/plggfsracing/TI;
		folder_name=`echo $file | cut -d . -f1`;
		mkdir -p  $file_path/$folder_name 2>&1 | log;

		# Move the .sim file and all script files to the new folder 
	#	cp batch.sh $file_path/$folder_name/batch.sh 2>&1 | log;
		cp $file $file_path/$folder_name/$file 2>&1 | log;
		
		for script in scripts/*
		do
			script_name=`basename $script`
			# Change placeholder(XXX) to the .sim file's name
			cat $script | sed s/XXX/$folder_name/g > $file_path/$folder_name/$script_name 2>&1 | log;
			chmod 770 $file_path/$folder_name/$script_name;
		done;
		
		wait
		job_id=`sbatch $file_path/$folder_name/simrun.sh | cut -d " " -f4`
		sbatch -d afterok:$job_id $file_path/$folder_name/pprun.sh

	done;
fi;

