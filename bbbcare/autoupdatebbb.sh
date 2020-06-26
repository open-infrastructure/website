#!/bin/bash

##################################################
# Upgrade BigBlueButton with Greenlight          #
# Dirty Hacked Script by Thies Mueller           #
# https://thiesmueller.de 		         #
###################################################



# Variables
# FQDN of the Server
BBBSERVER=


###################################################


echo '###############################################'
echo '# BigBlueButton AutoUpgrade '
echo '###############################################'

if [ "$BBBSERVER" != '' ]
  then
		echo '###############################################'
		echo '# Searching for Updates'
		echo '###############################################'
		apt update && apt list --upgradable


		echo '###############################################'
		echo '# Installing System & BBB Upgrades.'
		echo '###############################################'
		apt upgrade -y

		echo '###############################################'
		echo '# Reconfigure Host files for '$BBBSERVER
		echo '###############################################'
		echo 'bbb-conf --setip '$BBBSERVER

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
		echo '# Go to https://'$BBBSERVER'/b to check if everythings fine.'
		echo '# Wait a few seconds (up to 2 minutes)'
		echo '###############################################'

else


	echo '###############################################'
	echo '# Please specify Hostname in the Script!'
	echo '###############################################'

fi
