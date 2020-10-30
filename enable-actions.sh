#!/bin/bash

USERNAME=reserveword
REPONAME=acme-autorenew

curl https://api.github.com/repos/${USERNAME}/${REPONAME}/actions/workflows/run.yml/enable -X PUT -K github-token.key