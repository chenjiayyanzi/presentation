#!/bin/bash
set -e 
trap _cleanup EXIT

MY_NAME=${MY_NANE}
DIRS="Working-Experience Education Certificate Language Contact Tech"
WORK="102020-now 082020-now 052015-082020 Stage"
EDU="Master Bachelor"
CERT="Linux French"
LAN="Chinese French English"
CON="Email Phone Linkedin"
TECH="Linux Ansible Docker Database Firewall"

_create_dirs()
{
 for dir in $DIRS ; do
   mkdir -p $MY_NAME/$dir
 done
}

_create_layer2()
{
for dir in $DIRS; do
  case "$dir" in
    "Working-Experience") for exp in $WORK; do mkdir -p $MY_NAME/$dir/$exp; done
    ;;
    "Education") for edu in $EDU; do mkdir -p $MY_NAME/$dir/$edu; done
    ;;
    "Certificate") for cert in $CERT; do mkdir -p $MY_NAME/$dir/$cert; done
    ;;
    "Language") for lan in $LAN; do mkdir -p $MY_NAME/$dir/$lan; done
    ;;
    "Contact") for con in $CON; do mkdir -p $MY_NAME/$dir/$con; done
    ;;
    "Tech") for tech in $TECH; do mkdir -p $MY_NAME/$dir/$tech; done
    ;;
  esac
done
}

_precheck()
{
  if [ -e $MY_NAME ]; then
    echo "Cannot generate CV for $MY_NAME: Already exists. Qutting."
    trap - EXIT
    exit 0
  fi
}

_cleanup()
{
 /bin/echo -n "Error encoutered. Clearing..."
 rm -rf $MY_NAME
 echo "done"
}


_precheck
_create_dirs
_create_layer2
echo "CV for '$MY_NAME' has been successfully generated"
trap - EXIT

