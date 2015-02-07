#!/bin/bash
# REMOVE this is a template shell script, use it wisely

# Basic info
# Name
MYNAME=${0##*/} # Full name i.e. template.sh
# Version
MYVERS=1.01
# Author
MYAUTH="Erfan Yousefi"

# Text tools
RED='\033[0;31m'	# Red Color
GRE='\033[0;32m'	# Green Color
NC='\033[0m'		# No Color
UNDERLINE=`tput smul`
NOUNDERLINE=`tput rmul`
BOLD=`tput bold`
NOBOLD=`tput sgr0`

# Flags
# Add option flags here

# Usage message
function usage() {
	echo "$(echo "${MYNAME%.}" | tr '[:lower:]' '[:upper:]')"
	echo "${BOLD}NAME${NOBOLD}"
	echo -e "\t${BOLD}${MYNAME%.}${NOBOLD}"
	echo "${BOLD}SYNOPSIS${NOBOLD}"
	echo -e "\t${UNDERLINE}ADD OWN SYNOPSIS${NOUNDERLINE}"
	echo "${BOLD}DESCRIPTION${NOBOLD}"
	echo -e "\tADD OWN DESCRIPTION"
	echo "${BOLD}OPTIONS${NOBOLD}"
	echo -e "\t${BOLD}--help${NOBOLD}"
	echo -e "\t\tShow usage message and exit"
	echo -e "\t${BOLD}-v, --version${NOBOLD}"
	echo -e "\t\tShow version information and exit"
	echo "${BOLD}AUTHOR${NOBOLD}"
	echo -e "\t${MYAUTH}"
}

# Version information
function version() {
	echo "${MYNAME%.} version ${MYVERS}"
	echo "Copyleft (C) $(date '+%Y') ${MYAUTH}"
	echo "License GPL Version 3 or later, see https://www.gnu.org/copyleft/gpl.html"
}

# Parse provided command arguments
function parseArgs() {
	# Since getopts does not support long options,
	# we'll have our own instead.
	while [ "$1" != "" ]; do
	    case $1 in
	    #  "-c" | "--configFile") # In case an option needed an argument 
		#	shift
		#	configFile=$1
		#	;;
      	  "--help")
        	usage
        	exit
        	;;
      	  "-v" | "--version")
        	version
        	exit
        	;;
          *)
			echo "Invalid argument. Use --help to see usage."
			exit
			;;
    	esac
    shift
	done
}

parseArgs $*
# Happy scripting