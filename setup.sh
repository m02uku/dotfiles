apt update && apt install -y \
  curl \
  git \
  figlet \
  cmatrix \
  neofetch \

curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
starship preset gruvbox-rainbow -o ~/.config/starship.toml

