#!/bin/bash

##################################################
# Upgrade BigBlueButton with Greenlight          #
# Dirty Hacked Script by Thies Mueller           #
# https://thiesmueller.de 		         #
###################################################




###################################################


echo '###############################################'
echo '# BigBlueButton AutoUpgrade '
echo '###############################################'

if [ "$1" != '' ]
  then 
		echo '###############################################'
		echo '# Searching for Updates'
		echo '###############################################'
		apt update && apt list --upgradable
	

		echo '###############################################'
		echo '# Installing System & BBB Upgrades.'
		echo '###############################################'
		apt upgrade $2

		echo '###############################################'
		echo '# Reconfigure Host files for '$1
		echo '###############################################'
		echo 'bbb-conf --setip '$1

		echo '###############################################'
		echo '# Upgrade Greenlight'
		echo '###############################################'
		cd /root/greenlight/ && docker-compose pull && docker-compose down && docker-compose up -d


	
		echo '###############################################'
		echo '# Move custom Homepage'
		echo '###############################################'

		cp /var/www/index.html /var/www/bigbluebutton-default/index.html -f
		echo '###############################################'
		echo "# I'm done here"
		echo '# Go to https://'$1'/b to check if everythings fine.'
		echo '# Wait a few seconds (up to 2 minutes)'
		echo '###############################################'

else


	echo '###############################################'
	echo '# Please specify Hostname as the first parameter!'
	echo '###############################################'

fi
