ACME_DATA=$PWD/.acme.sh
export LE_WORKING_DIR=$ACME_DATA

EXEC=${SECRET_FILES:-"echo 'NO SECRET_FILES FOUND, EXITING'; exit 1"}
echo "$EXEC"
$($EXEC) || exit 1

acme.sh/acme.sh --renew-all