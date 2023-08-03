#Тестовые задания по Perl REG-ru_Center

#orig>my @unsorted = ( qw/ 7 1 3 4 2 4 6 5 5 / );
#orig>Напиши алгоритм, который отсортирует этот массив. sort нельзя. 
#orig>Можно  bubble sort.
#orig>Напиши алгоритм двоичного поиска. Если поиск удачный,
#orig>выводится MATCH, неудачный - NOT_MATCH.
#orig>Нужно написать программу - “Замечательная телефонная книжка”....
#orig>Если наши задачи не нравятся, то можно придумать свое ТЗ, описать
#orig>его словами, написать код.

НЕ НРАВЯТСЯ. 
Особенно - трудоёмкая скучная и глупая книжка, если исполнять его честно и без копипасты. 
а. Пусть нужно написать примитивный  CGI-скрипт,
“Бесполезная тупая телефонная книжка” менее чем за 3 дня.
Функции:
- показать все контакты
- добавить контакт
- удалить контакт
- изменить контакт
Исполнить её с подключением внешнего конфига. 
Всю логику - в один файл,
Все запросы - к единственному скрипту. 
Никаких яваскриптов - только олдскул.
Без копипаст, Хотя бы без крупных: нам важно понять твой собственный стиль. 
Снабдить комментариями.
Оставить примеры отладочных строк.
Приложить дамп БД.
 код - 
	index.pl 
	https://github.com/yozkiyokly/REG-ruCenter_Tasks/blob/main/index.pl
	
	configFile.pm 
	https://github.com/yozkiyokly/REG-ruCenter_Tasks/blob/main/configFile.pm
 
 дамп таблицы с инициальными данными - 
	addrbook.sql 
	https://github.com/yozkiyokly/REG-ruCenter_Tasks/blob/main/addrbook.sql

------------
б. Ещё нужно написать утилиту для командной строки, наглядно показывающую преимущества двоичного поиска над линейным в сортированных данных.
От исполнения этого задания хотя бы возможно получить некоторую реальную пользу:
Пользователь-студент должен получить возможность визуально наблюдать процесс сортировки с секундомером в руках, меняя условия поиска. 
Требуется предоставить возможность передачи утилите данных для сортировки через командную строку.
Данные должны разделяться прбелами. Первая опция - поисковый паттерн, последующие - элементы массива, подлежащие сортировке и последующему поиску обоими методами.
пример:  >arraySearch.pl 22 3 4 5 44 6 7 8 55 6 7 6 43 4 22 3
22 - поисковый паттерн. он будет найден, поскольку в конце строки имеется такое число среди элементов будущего массива.
При отсутствии параметров предусмотри дефолтные.
файл: 
	arraySearch.pl  
	https://github.com/yozkiyokly/REG-ruCenter_Tasks/blob/main/arraySearch.pl

------------
в. Cледует показать использование перлом никсовых олдскульных консольных библиотек, 
наподобие  nCursesLIB.
Пусть сортировка массива будет отображаться необычно. 
прояви фантазию, удиви современников экзотическим инструментом из архаичного прошлого, 
покажи какой ты старый и ядрёный.

Напиши скрипт для командной строки, сортирующий массив 
my @unsorted = ( qw/ 7 1 3 4 2 4 6 5 5 / );
Пользоваться встроенной функцией sort нельзя. 
Для простоты можно написать алгоритм bubble sort.
Использование вызовa SYSTEM будет плюсом.

файл: 
	arraySortCURSES.pl 
	https://github.com/yozkiyokly/REG-ruCenter_Tasks/blob/main/arraySortCURSES.pl

------------	
