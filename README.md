# Food delivery network Star Burger

This is a website of the restaurant chain Star Burger. Here one can order supreme burgers delivered straight to your door.

![скриншот сайта](https://dvmn.org/filer/canonical/1594651635/686/)


The Star Burger network consists of several restaurants operating under a single franchise. All restaurants have the same menu and the same prices. Simply choose a meal from the menu on the website and specify an address for delivery. We will find the restaurant nearest to you, will cook your food for you and will deliver it to you.

The website has three independent interfaces. The first one is the public interface, where one can choose meals from the menu and quickly place an order without registration.

The second interface is mean for the order manager. Here, order processing happens. The manager sees incoming orders and calls the customers to confirm their orders, where necessary. Then the operator chooses the nerarest restaurant and passes the order for processing (i.e. for cooking and delivery).

The third interface is the admin panel. It is mainly used by the website developers. The order manager also comes here from time to time, such as to update the restaurants' menus.

## How to launch the development version of the website

To launch the development version, you need to launch the backend part and the frontend part.

### How to assemble the backend

Download the code:
```sh
git clone https://github.com/hyperfield/star-burger-django.git
```

Go to the project directory:
```sh
cd star-burger
```

[Install Python](https://www.python.org/), if not already done.

Make sure that `python` is intalled and setup correctly. Launch it in the command line:
```sh
python --version
```
**Important!** The Python version must be no less than 3.6.

It is possible that, instead of the command `python`, here and in this README you'll have to use `python3`. This depends on your operating system and on how old your Python version is.

Create a virtual environment in the project directory:
```sh
python -m venv venv
```
Activate it. It is done with different commands in different operating systems:
- Windows: `.\venv\Scripts\activate`
- MacOS/Linux: `source venv/bin/activate`


Install the dependencies and the virtual environment:
```sh
pip install -r requirements.txt
```

Create the SQLine database file and migrate the database as follows:

```sh
python manage.py migrate
```

Launch the backend server:

```sh
python manage.py runserver
```

Open the website in a webbrowser at [http://127.0.0.1:8000/](http://127.0.0.1:8000/). If you see just an empty page, then there's nothing wrong with this, this means that the frontend has not yet been assembled.

### Assemble the frontend

**Откройте новый терминал**. Для работы сайта в dev-режиме необходима одновременная работа сразу двух программ `runserver` и `parcel`. Каждая требует себе отдельного терминала. Чтобы не выключать `runserver` откройте для фронтенда новый терминал и все нижеследующие инструкции выполняйте там.

[Установите Node.js](https://nodejs.org/en/), если у вас его ещё нет.

Проверьте, что Node.js и его пакетный менеджер корректно установлены. Если всё исправно, то терминал выведет их версии:

```sh
nodejs --version
# v12.18.2
# Если ошибка, попробуйте node:
node --version
# v12.18.2

npm --version
# 6.14.5
```

Версия `nodejs` должна быть не младше 10.0. Версия `npm` не важна. Как обновить Node.js читайте в статье: [How to Update Node.js](https://phoenixnap.com/kb/update-node-js-version).

Установите необходимые пакеты. В каталоге проекта запустите:

```sh
npm install --dev
```

Установите [Parcel](https://parceljs.org/). Это упаковщик веб-приложений. Он похож на [Webpack](https://webpack.js.org/), но совсем не требует настроек:

```sh
npm install -g parcel@latest  # понадобятся права администратора `sudo`
```

Вам нужна вторая версия Parcel. Проверьте, что `parcel` установлен и его версию в командной строке:

```sh
$ parcel --version
2.0.0-beta.2
```

Почти всё готово. Теперь запустите сборку фронтенда и не выключайте. Parcel будет работать в фоне и следить за изменениями в JS-коде:

```sh
parcel watch bundles-src/index.js --dist-dir bundles --public-url="./"
```

Дождитесь завершения первичной сборки. Это вполне может занять 10 и более секунд. О готовности вы узнаете по сообщению в консоли:

```
✨  Built in 10.89s
```

Parcel будет следить за файлами в каталоге `bundles-src`. Сначала он прочитает содержимое `index.js` и узнает какие другие файлы он импортирует. Затем Parcel перейдёт в каждый из этих подключенных файлов и узнает что импортируют они. И так далее, пока не закончатся файлы. В итоге Parcel получит полный список зависимостей. Дальше он соберёт все эти сотни мелких файлов в большие бандлы `bundles/index.js` и `bundles/index.css`. Они полностью самодостаточно и потому пригодны для запуска в браузере. Именно эти бандлы сервер отправит клиенту.

Теперь если зайти на страницу  [http://127.0.0.1:8000/](http://127.0.0.1:8000/), то вместо пустой страницы вы увидите:

![](https://dvmn.org/filer/canonical/1594651900/687/)

Каталог `bundles` в репозитории особенный — туда Parcel складывает результаты своей работы. Эта директория предназначена исключительно для результатов сборки фронтенда и потому исключёна из репозитория с помощью `.gitignore`.

**Сбросьте кэш браузера <kbd>Ctrl-F5</kbd>.** Браузер при любой возможности старается кэшировать файлы статики: CSS, картинки и js-код. Порой это приводит к странному поведению сайта, когда код уже давно изменился, но браузер этого не замечает и продолжает использовать старую закэшированную версию. В норме Parcel решает эту проблему самостоятельно. Он следит за пересборкой фронтенда и предупреждает JS-код в браузере о необходимости подтянуть свежий код. Но если вдруг что-то у вас идёт не так, то начните ремонт со сброса браузерного кэша, жмите <kbd>Ctrl-F5</kbd>.


## Как запустить prod-версию сайта

Собрать фронтенд:

```sh
parcel build bundles-src/index.js --dist-dir bundles --public-url="./"
```

Настроить бэкенд: создать файл `.env` в каталоге `star_burger/` со следующими настройками:

- `DJANGO_SETTINGS_MODULE` - путь к файлу настроек Django.
- `DEBUG` — дебаг-режим. Поставьте `False`.
- `SECRET_KEY` — секретный ключ проекта. Он отвечает за шифрование на сайте. Например, им зашифрованы все пароли на вашем сайте. Не стоит использовать значение по-умолчанию, **замените на своё**.
- `ALLOWED_HOSTS` — [см. документацию Django](https://docs.djangoproject.com/en/3.1/ref/settings/#allowed-hosts).
- `YANDEX_GEOCODER_API_KEY` - API-ключ от сервиса Yandex Geocoder. Сервис используется для вычисления расстояний между ресторанами и клиентами. Ключ можно получить по [этому адресу](https://developer.tech.yandex.ru/).

## Цели проекта

Код написан в учебных целях — это урок в курсе по Python и веб-разработке на сайте [Devman](https://dvmn.org). За основу был взят код проекта [FoodCart](https://github.com/Saibharath79/FoodCart).

Где используется репозиторий:

- Второй и третий урок [учебного модуля Django](https://dvmn.org/modules/django/)
