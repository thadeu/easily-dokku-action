#!/bin/sh

set -e

SSH_PATH="$HOME/.ssh"
DEPLOY_BRANCH="${BRANCH-master}"
DEPLOY_PORT="${PORT-22}"

mkdir -p "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

echo "$SSH_PRIVATE_KEY" > "$SSH_PATH/deploy_key"
echo "$SSH_PUBLIC_KEY" > "$SSH_PATH/deploy_key.pub"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"
chmod 600 "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key.pub"

eval "$(ssh-agent)"
ssh-add "$SSH_PATH/deploy_key"

ssh-keyscan -t rsa "$HOST" >> "$SSH_PATH/known_hosts"

git checkout "$DEPLOY_BRANCH"

echo "Running deploy to $SSH_HOST on branch $DEPLOY_BRANCH"

GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p ${DEPLOY_PORT-22}" git push ${FLAGS} dokku@"$SSH_HOST":"$PROJECT" $DEPLOY_BRANCH:master