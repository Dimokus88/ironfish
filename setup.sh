#!/bin/bash

#====================================
#=============by Dimokus=============
#========https://t.me/Dimokus========
#====================================
echo 'export my_root_password='${my_root_password}  >> $HOME/.bashrc
echo 'account_name='${account_name}  >> $HOME/.bashrc
echo 'export Graffiti='${Graffiti} >>  $HOME/.bashrc
echo 'NODE_NAME='${NODE_NAME}  >> $HOME/.bashrc
echo 'EMAIL='${EMAIL}  >> $HOME/.bashrc
echo 'POOL='${POOL}  >> $HOME/.bashrc
echo 'export LINK_WALLET='${LINK_WALLET} >>  $HOME/.bashrc

source $HOME/.bashrc
cd /
wget -O wallet.json ${LINK_WALLET}
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
sleep 15


service ssh restart
service nginx start
cd ~/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd ~/.nvm
git checkout v0.39.1
. ./nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. ./nvm.sh
source $HOME/.bashrc

cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh -y
sudo apt install nodejs -y
node -v
nvm install 16.15.0
nvm use 16.15.0
mkdir /usr/app
cd /usr/app
sudo npm install -g ironfish --unsafe-perm
source $HOME/.bashrc
cd /
echo запускаем =====================
if  [[ -z "${LINK_WALLET}" ]]
then
	echo файл кошелька не обнаружен! Создаю новый. Незабудьте сохранить его копию!
	sleep 10
	(echo "${account_name}") | sudo ironfish accounts:create
	echo `sudo ironfish accounts:export ${account_name}` >> wallet.json
	cp ./wallet.json /var/www/html/
	sudo ironfish accounts:use ${account_name}
	echo Кошелек создан! Сохраните его копию!
	cat wallet.json
	echo Запрос токенов из крана
	(echo ${EMAIL}) | sudo ironfish faucet
	sleep 1m
else
	echo Обнаружен файл кошелька
	cat wallet.json
	sleep 20
	account_name=`cat wallet.json | jq -r '.name'`
	echo Имя аккаунта ${account_name}
	sudo ironfish accounts:import wallet.json
	sudo ironfish accounts:use ${account_name}
	echo Запрос токенов из крана
	(echo ${EMAIL}) | sudo ironfish faucet
	
	
fi
PUBLIC_KEY=`cat wallet.json | jq -r '.publicAddress'`
echo $PUBLIC_KEY
sudo ironfish config:set enableTelemetry true
sudo ironfish config:set blockGraffiti "${Graffiti}"
echo ===========
sleep 10
echo Запуск ноды
nohup  sudo ironfish start --name ${NODE_NAME}  >node.out 2>node.err </dev/null &
sleep 15
echo Запуск майнера
nohup  sudo ironfish miners:start --pool ${POOL} --address ${PUBLIC_KEY} >miner.out 2>miner.err </dev/null &
sleep 15

for ((;;))
do
tail ./node.err
tail ./node.out
sleep 1m
tail ./miner.err
tail ./miner.out
sleep 1m
sudo ironfish status
sleep 1m
echo Проверка баланса 
sudo ironfish deposit
sudo ironfish accounts:balance
echo =================
sleep 10
done
sleep infinity