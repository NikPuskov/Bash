# Bash

Для работы поднят стенд на Vagrant с box `bento/ubuntu-24.04` (Vagrantfile прилагается) , установлена утилита `mailutils` 

Для запуска скрипта: `bash script.sh access.log` (скрипт и лог прилагаются)

Результат `sudo mail` (файл rezult прилагается)

Добавляем задание в Cron `crontab -e` 

В открывшемся файле добавляем строку `@hourly /vagrant/script.sh`
