# Install node.js stuff

> https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script
echo 'Installing NVM' \

## Nvm and node

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | zsh
    export NVM_DIR="~/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install node && nvm use node && node --version > ~/.nvmrc

## Npm global packages

    npm i -g typescript ts-node nodemon
