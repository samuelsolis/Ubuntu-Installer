# General Tools
sudo apt-get update
sudo apt-get install -y xchat curl
sudo apt-get install -y ubuntu-restricted-extras vlc
sudo apt-get install -y libcurl3 gthumb trash-cli
sudo apt-get install -y mlocate && sudo updatedb
sudo apt-get install -y lm-sensors

# Apache and PHP
sudo apt-get install -y apache2 php-mysql libapache2-mod-php mysql-client-5.6 mysql-server php-pear mailutils postfix
sudo apt-get install -y php-xsl php-gd php-curl php-json
sudo touch /etc/apache2/conf-available/name.conf
sudo sh -c 'echo "ServerName localhost" >> /etc/apache2/conf-available/name.conf' && a2enconf name && sudo service apache2 restart

# Programming tools
sudo pear channel-update pear.php.net
sudo pear install PHP_Debug

# Git
sudo apt-get install -y git-core
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global user.name "Samuel"
git config --global user.email samuel.solis@edoctores.com
git config --global alias.st status
git config --global alias.duff 'diff --cached'
git config --global alias.logf 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
git config --global alias.ld 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
git config --global alias.logv 'log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

'"]]]"'
wget https://raw.githubusercontent.com/git/git/8976500cbbb13270398d3b3e07a17b8cc7bff43f/contrib/completion/git-prompt.sh
mv git-prompt.sh ~/.git-prompt.sh
cat <<EOT>> ~/.bashrc
# Show the current Git branch in the command prompt.
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
EOT

# PHP tools
sudo apt-get install -y php5-dev
sudo pear install -y PHP_CodeSniffer-1.3.0RC1
sudo pear channel-discover pear.phing.info
sudo pear install phing/phing
sudo cp ~/projects/Ubuntu-Installer/php-settings/apache/* /etc/php5/apache2/conf.d/
sudo cp ~/projects/Ubuntu-Installer/php-settings/cli/* /etc/php5/cli/conf.d/
sudo apt-get install php5-xdebug

# PECL & extensions
sudo apt-get install php-pear php5-dev
sudo pecl install uploadprogress
sudo pecl install oauth
sudo pecl install -f xhprof
echo 'extension=oauth.so' | sudo tee -a /etc/php5/apache2/conf.d/settings.ini
echo 'extension=oauth.so' | sudo tee -a /etc/php5/cli/conf.d/settings.ini
echo 'extension=xhprof.so' | sudo tee -a /etc/php5/apache2/conf.d/settings.ini
echo 'extension=xhprof.so' | sudo tee -a /etc/php5/cli/conf.d/settings.ini
echo 'extension=uploadprogress.so' | sudo tee -a /etc/php5/apache2/conf.d/settings.ini
sudo service apache2 restart

# phpunit
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit
phpunit --version

# Editing Tools
sudo apt-get -y install vim vim-gnome exuberant-ctags
curl http://j.mp/spf13-vim3 -L -o - | sh
cp ~/projects/Ubuntu-Installer/.vimrc.local ~/
cp ~/projects/Ubuntu-Installer/.vimrc.before.local ~/

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Drush
git clone https://github.com/drush-ops/drush.git 
chmod u+x drush/drush
sudo mv drush /usr/share/
sudo ln -s /usr/share/drush/drush /usr/bin/drush
drush status

# Apache Solr
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer
#wget http://apache.rediris.es/lucene/solr/3.6.2/apache-solr-3.6.2.tgz
#mkdir ~/software
#tar -xvzf apache-solr-3.6.2.tgz -C ~/software/

# Hub for Github
#sudo apt-get -y install ruby
#sudo curl http://defunkt.io/hub/standalone -sLo /usr/bin/hub && sudo chmod +x /usr/bin/hub
# Compass
sudo apt-get -y install ruby
sudo gem install compass

# Virtual Box IE test machines (needs VB set up first)
# curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
