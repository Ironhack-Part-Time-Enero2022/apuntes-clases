#This file is a summary of all the every installation explained in this repository.
#You can also find it here: https://github.com/breogann/installation-for-bootcamp



########## 1. GIT, PYTHON, JUPYTER, PIP, HOMEBREW & iTerm2 ##########

#1.1. Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
say -v Monica "bru instalado"

#1.2. Installing zsh + ohmyzsh + iterm2
brew install --cask iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #install zsh
chsh -s /usr/local/bin/zsh #changes the shell to zsh. It should be already set by the previous line, but just to be sure.
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc #so that the whole path shows
say -v Monica "terminal instalada"

#1.3. Installing git
brew install git
say -v Monica "git instalado"

#1.3.1. Linking Git with Github
git config --global user.name “YOUR_GITHUB_USERNAME”;
git config --global user.email YOUR_EMAIL@DOMAIN.COM
git config --global credential.helper store #this will make sure you don't have to input your password every time you commit

#1.4. Python
brew install python3
say -v Monica "paizon instalado"

#1.5. Pip3
pip install --upgrade pip
say -v Monica "pip instalado"

#1.6. Jupyter
say -v Monica "¿Cuál es la contraseña?"
sudo python3 -m pip install jupyter
say -v Monica "yúpiter instalado"

#1.7. Miniconda
brew install --cask miniconda
say -v Monica "miniconda instalado"

#1.8. Checking everything's up to date
git --version
brew -v
python3 --version
pip -V


########## 2. DEPLOYMENT ##########

#2.1. Heroku
brew tap heroku/brew && brew install heroku
say -v Monica "Heroku instalado"

########## 3. VISUALIZATION ##########

#3.1. Tableau
brew install --cask tableau
say -v Monica "tabló instalado"

########## 4. MISCELLANEOUS ##########

#4.1. Installing the rest
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask zoomus

########## 5. DATABASES ##########

#5.1. MongoDB
brew tap mongodb/brew
brew install mongodb-community@4.4 #Install
brew services start mongodb-community@4.4 #Start
brew install mongodb/brew/mongodb-database-tools #For future mongodump and mongorestore
#mongorestore dump/
brew install --cask mongodb-compass
say -v Monica "Mongo instalado"

#5.2. MySQL
brew install mysql
brew install --cask homebrew/cask-versions/sequel-pro-nightly
brew install --cask mysqlworkbench
say -v Monica "sícuel instalado"

#5.2.1. MySQL password
mysql.server start
sudo mysql -u root
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin'; #Substitute 'admin' by your password
FLUSH PRIVILEGES;
QUIT;