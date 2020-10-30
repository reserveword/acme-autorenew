#!/bin/bash
rm -r .acme.sh
cp -r ~/.acme.sh .acme.sh

echo -n > SECRET_FILES.key
for i in $(ls .acme.sh/*/*.key); do
    echo $i
    echo "cat << ~~EOF~~ > $i" >> SECRET_FILES.key
    cat $i >> SECRET_FILES.key
    echo "~~EOF~~" >> SECRET_FILES.key
done

for i in $(ls .acme.sh/ca/*/*.key); do
    echo $i
    echo "cat << ~~EOF~~ > $i" >> SECRET_FILES.key
    cat $i >> SECRET_FILES.key
    echo "~~EOF~~" >> SECRET_FILES.key
done

i=.acme.sh/account.conf
echo $i
echo "cat << ~~EOF~~ > $i" >> SECRET_FILES.key
cat $i >> SECRET_FILES.key
echo "~~EOF~~" >> SECRET_FILES.key