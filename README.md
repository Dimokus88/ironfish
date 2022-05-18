# Deployment Ironfish on Akash Network 
# Развертка Ironfish в Akash Network 
<div align="center">

![pba](https://user-images.githubusercontent.com/23629420/163564929-166f6a01-a6e2-4412-a4e9-40e54c821f05.png)
| [Akash Network](https://akash.network/) | [Forum Akash Network](https://forum.akash.network/) | 
|:--:|:--:|
___
Before you start - subscribe to our news channels: 

Прежде чем начать - подпишитесь на наши новостные каналы:

| [Discord Akash](https://discord.gg/3SNdg3BS) | [Telegram Akash EN](https://t.me/AkashNW) | [Telegram Akash RU](https://t.me/akash_ru) | [TwitterAkash](https://twitter.com/akashnet_) | [TwitterAkashRU](https://twitter.com/akash_ru) |
|:--:|:--:|:--:|:--:|:--:|

</div>

<div align="center">
  
[English version](https://github.com/Dimokus88/ironfish/blob/main/README.md#english-version) | [Русская версия](https://github.com/Dimokus88/ironfish/blob/main/README.md#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B0%D1%8F-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F)
  
</div>

___
# Русская версия
## 1. Регистрация в программе вознаграждений.
 Преходим на сайт проекта и[ создаем учетную запись ](https://testnet.ironfish.network/signup) Укажите ваш ```Email```, ```Github```, ```Discord``` или ```Telegram```, страну проживания. Также укажите ваш ```Graffiti``` он будет необходим для индетификации в сети и начисления баллов за задания. 
![image](https://user-images.githubusercontent.com/23629420/169029990-ae514caa-2ded-4b99-85d2-0a901bde75e3.png)
## 2. Разворачиваем Ironfish

>На вашем кошельке Akash должно быть более ***5 АКТ*** (5 АКТ будут заблокированы на развертывание + оплата газа транзакций). АКТ можно пробрести на биржах Gate, AsendeX, Osmosis . Так же в нашем сообществе [Akash RU](https://t.me/akash_ru) мы регулярно проводим эвенты в которых раздаем АКТ.

* Открываем ***Akashlytics***, если он у вас не установлен - то вот [ссылка на скачивание](https://www.akashlytics.com/deploy).

* Проверяем наличие баланса ***(>5АКТ)*** и наличие установленного сертификата.

![image](https://user-images.githubusercontent.com/23629420/165339432-6f053e43-4fa2-4429-8eb7-d2fc66f47c70.png)

* Нажимаем ***CREATE DEPLOYMENT***. Выбираем ***Empty***(пустой template) и копируем туда содержимое [deploy.yml](https://github.com/Dimokus88/ironfish/blob/main/deploy.yml) .

## 2.1 Если разворачиваете ноду первый раз и у вас нет wallet.json

а) Заполняете следующие переменные:
* ```my_root_password``` - пароль ```root``` пользователя, для подключения к контейнеру по ```ssh```.
* ```account_name```     - Имя аккаунта(кошелька),так как нода запускается ***первый раз***.
* ```NODE_NAME```        - имя ноды.
* ```Graffiti```         - Ваше ```Graffiti``` из регистрации на сайте IronFish (***ВНИМАНИЕ! Чувствительно к регистру!!!***)
* ```EMAIL```            - ```Email``` на который зарегистрировались на сайте IronFish.
* ```POOL```             - майнинговый пул. Можете оставить по-умолчанию, удалить если хотите майнить самостоятельно или введите адрес вашего майнингово пула.
> ```LINK_WALLET```      - закомментируйте, поставив # в начале строки.

Ниже, в поле ```resources``` мы выставляем арендуюмую мощность. для ноды IronFish рекомендуется ```4 CPU x 8 GB RAM x 10 GB SSD```.

Нажимаем кнопку ```CREATE DEPLOYMENT``` и ждем появления провайдеров, со свободными мощностями (BIDS).

![image](https://user-images.githubusercontent.com/23629420/165608527-da85c84e-edcc-4b15-8843-441d3e76dcb6.png)

Выбираем подходящий для нас по цене и оборудованию. После чего нажимаем ```ACCEPT BID```.

б )Перейдите во вкладку ***LOGS->LOGS***

в) Дождитесь создания ***wallet.json***, появится соответствующее сообщение (около минут 8 от запуска контейнера).
![image](https://user-images.githubusercontent.com/23629420/169107125-4e30453a-3666-4b1c-bdd7-93e552075b9e.png)


г) Скопируйте ссылку (***Uris***)на развертывание во вкладке ***LEASES***  и в конце ссылки добавьте ```/wallet.json``` после чего перейдите по ссылке. (пример ссылки ```http://mcbp2gf6g9ad77vvapnblq3n6k.palmito.duckdns.org/wallet.json```)

![image](https://user-images.githubusercontent.com/23629420/169107182-ad51d375-b171-4195-8538-313bbe6549f0.png)

д) Скопируйте вывод из браузера в файл ```wallet.json``` с помощью любого текстового редактора.

![image](https://user-images.githubusercontent.com/23629420/169107385-2ab958d0-5789-4202-af64-1deac1b599a5.png)


е) Сохраните файл ***wallet.json*** на Google диске и откройте доступ к файлу, скопируйте его ссылку, она будет вида:

```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs```

 вам нужно взять часть: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` и вставить перед ней: ```https://drive.google.com/uc?export=download&```.
 
Таким образом, у вас получится ссылка на прямое скачивание файла:

```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx```

ж) Измените манифест во вкладке ***UPDATE*** по примеру из п.2.2 (см ниже) и нажмите ***UPDATE DEPLOYMENT***

## 2.2 Если у вас уже есть wallet.json
>Сохраните файл ***wallet.json*** на Google диске и откройте доступ к файлу, скопируйте его ссылку, она будет вида:
```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs```
 вам нужно взять часть: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` и вставить перед ней: ```https://drive.google.com/uc?export=download&```. 
Таким образом, у вас получится ссылка на прямое скачивание файла:
```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx```

Заполняете следующие переменные:
* ```my_root_password``` - пароль ```root``` пользователя, для подключения к контейнеру по ```ssh```.
* ```LINK_WALLET```      - адрес скачивания вашего ```wallet.json```.
* ```NODE_NAME```        - имя ноды.
* ```Graffiti```         - Ваше ```Graffiti``` из регистрации на сайте IronFish (ВНИМАНИЕ! Чувствительно к регистру!!!
* ```EMAIL```            - ```Email``` на который зарегистрировались на сайте IronFish
* ```POOL```             - майнинговый пул. Можете оставить по-умолчанию, удалить если хотите майнить самостоятельно или введите адрес вашего майнингово пула.
> ```account_name```     - закомментируйте, поставив # в начале строки.

Запустите развертывание, нода начнет синхронизацию автоматически.Пример вывода в логах: 

![image](https://user-images.githubusercontent.com/23629420/169114122-24e056ac-c11b-4e9e-ae7b-d26bc06863b3.png)

После синхронизации начнется процесс майнинга. Так же, каждые 5 минут будет отправляться транзакция ```0,1 IRON``` в общий банк, за которую будут начислятся баллы в рейтинге.

[Explorer IronFish](https://explorer.ironfish.network/)

## Спасибо что используете Akash Network!
___
# English-version
