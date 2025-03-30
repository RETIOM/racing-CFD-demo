#/bin/bash

if [ -n "$1" ]
then
	folder_name=$1
	cd /net/pr2/projects/plgrid/plggfsracing/TI/simulations

	mkdir -p ~/simulations/scripts

	cat main_script.sh | sed s/TI/$folder_name/g > ~/simulations/main_script.sh
	chmod 770 ~/simulations/script

#	cat batch.sh | sed s/TI/$folder_name/g > ~/simulations/batch.sh
#        chmod 770 ~/simulations/batch.sh	

	for script in scripts/*
	do
		script_name=`basename $script`
		cat $script | sed s/TI/$folder_name/g > ~/simulations/scripts/$script_name
		chmod 770 ~/simulations/scripts/$script_name;
	done;
	echo "Succesfully installed scripts"
else
	echo "Please provide the name of Your folder on the plggfsracing directory on execution
Format: ./get_scripts folder_name"
fi
