$ACME_DATA=$pwd/.acme.sh
export LE_WORKING_DIR=$ACME_DATA

if [ -z $ACCOUNT_KEY ]; then
    echo $ACCOUNT_KEY > $ACME_DATA/ca/account.key
else
    echo "NO ACCOUNT_KEY FOUND, EXITING"
    exit 1
fi

if [ -z $ACCOUNT_CONF ]; then
    echo $ACCOUNT_CONF > $ACME_DATA/account.conf
else
    echo "NO ACCOUNT_CONF FOUND, EXITING"
    exit 1
fi

output_cert_keys(){
    while read line; do
        cert=($line)
        if [ -z ${cert[0]} ] && [ -z ${CERT[1]} ] && [ -d $ACME_DATA/${cert[0]} ]; then
            echo ${cert[1]} > $ACME_DATA/${cert[0]}/${cert[0]}.key
        else
            echo "CERT ${cert[0]::20}/${cert[1]::20} IS NOT A VALID CERT" # use start 20 char so that no secret is printed
            exit 1
        fi
    done
}

if [ -z $CERTS ]; then
    echo $CERTS | output_cert_keys;
else
    echo 'NO CERTS FOUND, EXITING'
    exit 1
fi


acme.sh/acme.sh --renew-all