clear

if [ ! -d "bot" ]; then
	mkdir bot
fi

cd bot

if [ -e "dadosBot.ini" ] ; then

	screen -X -S bot quit > /dev/null
	screen -dmS bot php bot.php
	echo "Bot has been restarted and is running in the background"

else

echo "Instaling dependencies, wait..."

#add-apt-repository ppa:ondrej/php > /dev/null 2>&1

apt-get update > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install php -y > /dev/null 2>&1
apt-get install php-redis -y > /dev/null 2>&1
apt-get install php-curl -y > /dev/null 2>&1
apt-get install php5 -y > /dev/null 2>&1
apt-get install php5-redis -y > /dev/null 2>&1
apt-get install php5-curl -y > /dev/null 2>&1
apt-get install redis-server -y > /dev/null 2>&1
apt-get install redis -y > /dev/null 2>&1
apt-get install screen -y > /dev/null 2>&1
apt-get install zip -y > /dev/null 2>&1

wget https://raw.githubusercontent.com/Lordsniffer22/tosbiteng/main/create_user.sh -O gerarusuario.sh; chmod +x gerarusuario.sh > /dev/null

wget https://github.com/Lordsniffer22/tosbiteng/raw/main/admysshbot.zip -O bot.zip && unzip bot.zip > /dev/null

rm dadosBot.ini > /dev/null

clear

ip=$(wget -qO- ipv4.icanhazip.com/)

echo "Enter your bot token:"
read token
clear
echo "ip=$ip
token=$token
limite=100" >> dadosBot.ini

screen -dmS bot php bot.php

rm bot.zip

echo "Soon, the bot is executing in the background
Unwrapper: @rickcloud"

fi
