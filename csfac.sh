#!/bin/bash
######################################################
#                                                    #
#   This Software Programmed By Reza Mohammadnezhad  #
#                                                    #
#        Copyright @ 2020 Allrights reserved         #
#                                                    #
######################################################

# Colors
ESC_SEQ="\x1b[";
COL_RESET=$ESC_SEQ"39;49;00m";
COL_RED=$ESC_SEQ"31;01m";
COL_GREEN=$ESC_SEQ"32;01m";
COL_YELLOW=$ESC_SEQ"33;01m";
COL_BLUE=$ESC_SEQ"34;01m";
COL_MAGENTA=$ESC_SEQ"35;01m";
COL_CYAN=$ESC_SEQ"36;01m";
# Welcome
clear
echo ""
echo ""
echo -e "$COL_YELLOW    |********************** Hello Dear Admin **********************|$COL_RESET"
echo -e "$COL_YELLOW    |                                                              |$COL_RESET"
echo -e "$COL_YELLOW    |          Cpanel Config (CSF Auto Configer Tool) v1.4         |$COL_RESET"
echo -e "$COL_YELLOW    |                                                              |$COL_RESET"
echo -e "$COL_YELLOW    |**************************************************************|$COL_RESET"
echo ""
echo ""
sleep 1
echo "Validating Your License... please wait"; sleep 10
#remove old files
rm -fv license.php &> /dev/null ;
rm -fv license &> /dev/null ;
# check License
license=`wget -qO- https://ir.acloud.ir/autoconfiger/csf/license.php` &> /dev/null ;
if [ $license == "OK" ]; then
  echo -e "$COL_GREEN You Have a Valid License ! $COL_RESET"
  sleep 1
else
  echo -e "$COL_RED You Havn't Valid License ! $COL_RESET"
  exit 1;
fi
#check csf exist
if [ -d "/etc/csf" ]
then
    echo -e "$COL_GREEN CSF already installed on your server. $COL_RESET"
	sleep 2
	echo -e "$COL_RED unistalling old files... $COL_RESET"
	sh /etc/csf/uninstall.sh > /dev/null
	sleep 1
	echo -e "$COL_GREEN old CSF unistalled Successful ! $COL_RESET"
	sleep 1
	echo -e "$COL_GREEN CSF is now installing... $COL_RESET"
cd /usr/src;
rm -fv csf.tgz &> /dev/null ;
wget https://download.configserver.com/csf.tgz &> /dev/null ;
tar -xzf csf.tgz &> /dev/null ;
cd csf;
sh install.sh &> /dev/null ;
cd /etc/csf;
mv csf.conf csf.conf.backup;
rm -fv csf.conf &> /dev/null ;
wget https://ir.acloud.ir/autoconfiger/csf/csf.conf &> /dev/null ;
csf -e &> /dev/null ;
csf -r &> /dev/null ;
sleep 1
echo -e "$COL_YELLOW CSF has been successfully installed and configured !!! $COL_RESET"
sleep 2
echo ""
echo -e "$COL_BLUE Thanks For Using CSF Auto Configer Tool ! $COL_RESET"
echo -e "$COL_BLUE www.CpanelConfig.ir $COL_RESET"
echo -e "$COL_BLUE Good Bye :) $COL_RESET"

else
	sleep 2
	echo -e "$COL_GREEN Installing New Files... $COL_RESET"
cd /usr/src;
rm -fv csf.tgz &> /dev/null ;
wget https://download.configserver.com/csf.tgz &> /dev/null ;
tar -xzf csf.tgz &> /dev/null ;
cd csf;
sh install.sh &> /dev/null ;
cd /etc/csf;
mv csf.conf csf.conf.backup;
rm -fv csf.conf &> /dev/null ;
wget https://ir.acloud.ir/autoconfiger/csf/csf.conf &> /dev/null ;
csf -e &> /dev/null ;
csf -r &> /dev/null ;
echo -e "$COL_YELLOW CSF has been successfully installed and configured !!! $COL_RESET"
sleep 2
echo ""
echo -e "$COL_BLUE Thanks For Using CSF Auto Configer Tool ! $COL_RESET"
echo -e "$COL_BLUE www.CpanelConfig.ir $COL_RESET"
echo -e "$COL_BLUE Good Bye :) $COL_RESET"
fi
