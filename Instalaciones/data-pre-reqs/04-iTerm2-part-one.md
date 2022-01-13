Yes, MacOS does come with a default Terminal installed, but we'll change it to one that is more useful. For that, there's three things we need to install:
# 4. iTerm2

### 1. Installing iTerm2
```bash
brew cask install iterm2
```
### 2. Installing zsh
```bash
brew install zsh
```
### 3. Installing oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

From now on, whenever we talk about the Terminal, we will be refering to iTerm2. Quit your native terminal app and remove it from your dock to avoid confusion.

In the next document we'll see some configuration for both the terminal and VSC.

You can check out more details in [this](https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c) medium post.