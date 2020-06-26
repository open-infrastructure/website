#!/bin/bash

# Autoinstall BBB on Ubuntu 16.04 with Greenlight & Copy default config

# Variables:
# Variables are Mandatory. Otherwise the script will fail and possibly corrupt the system.
# Also a Ubuntu 16.04 is mandatory!

# GOTO: https://open-infrastructure.de/custom.html to see the requirements

# Feel free to mailto:hi@open-infrastructure.de everytime if you want to get help with the setup.

##################
# BBBSERVER= URL for the Server (like bbb.jitsi.rocks)
BBBSERVER=bbb.jitsi.rocks
# BBBMAIL= Mail Address for some tasks. Preffered the Same as "SMTP_SENDER" in the greenlight setup
BBBMAIL=bbb@jitsi.rocks
###################

# GO!
# DON'T TOUCH ANYTHING BELOW THIS LINE IF YOU'RE NOT SURE WHAT YOU'RE DOING!

if [ "$1" == '' ]
	then 
echo '#######################################'
echo '# Installing BigBlueButton with original script from ubuntu.bigbluebutton.org'
echo '#######################################'
wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -s $BBBSERVER -e $BBBMAIL -g -v xenial-220
echo '#'
echo '#'
echo '#'
echo '#######################################'
echo '# Installation Done'
echo '#######################################'
echo '#######################################'
echo '#! Go to /root/greenlight/ and edit ".env"'
echo '#! Fill out at least the following options:'
echo 'SMTP_SERVER=<Your Mailserver>
SMTP_PORT=<Submissions Port of your Mailserver (mostly 587 / 25)>
SMTP_DOMAIN=<Sending Domain (Part after the "@")>
SMTP_USERNAME=<Username for Mailaddress>
SMTP_PASSWORD=<Password for the User>
SMTP_AUTH=plain
SMTP_STARTTLS_AUTO=true
SMTP_SENDER=<Sending Address (possibly '$BBBMAIL')>
ENABLE_SSL=true'

echo '#######################################'
echo '#'
echo '#'
echo '! Continue in a new ssh Session or Break with Ctrl+C and start the script with param "d" afterwards (./installbbb.sh d)'
read -p "Press any key to continue... " -n1 -s
fi
echo ' '
echo '#######################################'
echo '# running "updatebbb.sh" with params: '$BBBSERVER' & -y' 
echo '#######################################'
bash /root/updatebbb.sh $BBBSERVER -y

