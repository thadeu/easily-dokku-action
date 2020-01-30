FROM debian:stable-slim

# Github labels
# LABEL "com.github.actions.name"="easily-dokku-action"
# LABEL "com.github.actions.description"="Easily Dokku Deploy"
# LABEL "com.github.actions.icon"="mic"
# LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/thadeu/dokku-for-github-actions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Thadeu Esteves <tadeuu@gmail.com>"

RUN apt-get update && apt-get install -y \
  openssh-client \
  git && \
  rm -Rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]