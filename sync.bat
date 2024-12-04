CALL git config gpg.format ssh
CALL git config user.signingkey ../keys/id_core
CALL git add .
CALL git commit -m "Syncing..."
CALL git push