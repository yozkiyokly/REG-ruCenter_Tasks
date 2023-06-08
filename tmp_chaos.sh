#!/bin/bash
#В директории /var/logs/archive лежит файл backup.tar.gz. 
#Нужно:
#установить права на запись в эту директорию для всех пользователей;
chmod -R a+w /var/logs/archive 

##распаковать архив backup.tar.gz;
cd /var/logs/archive 
tar -xf backup.tar.gz 

##удалить все файлы имена которых заканчиваются на .tmp;
rm *.tmp

##вывести имена всех файлов которые содержат строку user deleted.
find ./ -type f -exec grep -H 'user deleted' {} \;


