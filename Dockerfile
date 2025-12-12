FROM python:3.14.2-alpine

# Prepare for installing dotfiles
COPY . /root/dotfiles

RUN apk update && \
    # Install core runtime packages
    apk add \
        bash zsh \
        curl git \
        neovim && \
    \
    # Install build dependencies
    apk add --no-cache --virtual .build \
        npm && \
    \
    # Install dotfiles
    ~/dotfiles/install && \
    \
    # Install Starship
    curl -sS https://starship.rs/install.sh | sh -s -- -y && \
    \
    # Install pyright
    npm install -g pyright && \
    \
    # Remove build packages and clean up cache
    apk del --purge .build && \
    apk cache clean --purge && \
    rm -rf /var/cache/apk/* && \
    rm -rf ~/.npm

WORKDIR /project

CMD ["/bin/zsh"]
