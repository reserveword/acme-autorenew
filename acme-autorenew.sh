ACME_DATA=$PWD/.acme.sh
export LE_WORKING_DIR=$ACME_DATA

EXEC=${SECRET_FILES:-"echo 'NO SECRET_FILES FOUND, EXITING'; exit 1"}
echo "$EXEC" | sh || exit 1

ls -lah acme.sh
./acme.sh/acme.sh --renew-all