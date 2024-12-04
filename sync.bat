CALL net start ssh-agent || echo SSH Agent is already running...
CALL ssh-add ../keys/id_core
CALL git config gpg.format ssh
CALL git config user.signingkey ../keys/id_core
CALL git add .
CALL git commit -m "Syncing..."
@REM CALL git push