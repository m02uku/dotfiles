FROM python:3.14.2-alpine

RUN apk --no-cache update && apk --no-cache add \
    bash zsh \
    curl git \
    neovim && \
    apk cache clean && \
    # Install Starship
    curl -sS https://starship.rs/install.sh | sh -s -- -y

COPY . /root/dotfiles
RUN ~/dotfiles/install

WORKDIR /project

CMD ["/bin/zsh"]
