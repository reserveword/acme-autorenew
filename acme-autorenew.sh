ACME_DATA=$PWD/.acme.sh
export LE_WORKING_DIR=$ACME_DATA

EXEC=${SECRET_FILES:-"echo 'NO SECRET_FILES FOUND, EXITING'; exit 1"}
$($EXEC) || exit 1

acme.sh/acme.sh --renew-all