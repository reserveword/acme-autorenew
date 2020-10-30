#!/bin/bash

USERNAME=reserveword
REPONAME=acme-autorenew

curl https://api.github.com/repos/${USERNAME}/${REPONAME}/actions/workflows/3173821/enable -X PUT -K github-token.key