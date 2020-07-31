FROM node:lts-slim

LABEL "com.github.actions.name"="gh-actions-nodejs"
LABEL "com.github.actions.description"="Node.js For Github Actions"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/Slishee/github-actions-nodejs"
LABEL "homepage"="https://github.com/Slishee/github-actions-nodejs"
LABEL "maintainer"="Linework IT <lineworkit@gmail.com>"

RUN \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -y && \
    apt-get install -y git yarn

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
