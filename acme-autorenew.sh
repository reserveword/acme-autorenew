$ACME_DATA=$PWD/.acme.sh
export LE_WORKING_DIR=$ACME_DATA

if [ -z "$SECRET_FILES" ]; then
    source $SECRET_FILES;
else
    echo "NO SECRET_FILES FOUND, EXITING"
    exit 1
fi

acme.sh/acme.sh --renew-all