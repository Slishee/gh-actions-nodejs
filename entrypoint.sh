#!/bin/sh -l

# env
echo "# env";
sh -c "env";

# Install Packages
apt install curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update -y
apt-get install -y git yarn

# event.json
if [ -n "$GITHUB_EVENT_PATH" ]; then
  echo "# event.json";
  cat "$GITHUB_EVENT_PATH";
fi

sh -c "$*";
