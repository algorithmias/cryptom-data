#!/bin/sh

eval "$(ssh-agent -s)"
ssh-add ../keys/id_core
git config gpg.format ssh
git config user.signingkey ../keys/id_core
git add .
git commit -m "Syncing..."
git push