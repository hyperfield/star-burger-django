# Food delivery network Star Burger

This is a website of the restaurant chain Star Burger. Here one can order supreme burgers delivered straight to your door.

![скриншот сайта](https://dvmn.org/filer/canonical/1594651635/686/)


The Star Burger network consists of several restaurants operating under a single franchise. All restaurants have the same menu and the same prices. Simply choose a meal from the menu on the website and specify an address for delivery. We will find the restaurant nearest to you, will cook your food for you and will deliver it to you.

The website has three independent interfaces. The first one is the public interface, where one can choose meals from the menu and quickly place an order without registration.

The second interface is meant for the order manager. Here, order processing happens. The manager sees incoming orders and calls the customers to confirm their orders, where necessary. Then the operator chooses the nerarest restaurant and passes the order for processing (i.e. for cooking and delivery).

The third interface is the admin panel. It is mainly used by the website developers. The order manager also comes here from time to time, such as to update the restaurants' menus.

## Installing the Postgres database system

The website works with PostgreSQL via the Django ORM, so one has to have Postgres installed on the system. PostgreSQL is a free and open source database management system, which can be downloaded from [postgresql.org](https://www.postgresql.org/) or from your Linux distro repository.

Once Postgres has been installed, a user called `postgres` is created. This user is a superuser (a 'root' user) for the database control system. If you are in Linux, the following command switches your console to this user for convenient management of the databases, such as database creation, deletion, and implementation.

    sudo su - postgres

The database system is then launched by

    psql

Once there, create a new database to be used by Starburger:

    CREATE DATABASE starburger;

And create a corresponding user (but choose your own good password):

    CREATE USER starburger WITH PASSWORD 'password';

Assign proper character encoding, database transaction reading and control privileges, and set the time zone to UTC (prescribed by Django standards):

    ALTER ROLE starburger SET client_encoding TO 'utf8';
    ALTER ROLE starburger SET default_transaction_isolation TO 'read committed';
    ALTER ROLE starburger SET timezone TO 'UTC';
    GRANT ALL PRIVILEGES ON DATABASE myproject TO myprojectuser;

Then exit the database control system and the `postgres` user console prompt:

    \q
    exit

## Using Rollbar

Starburger uses [Rollbar](http://rollbar.com) for efficient error reporting. Please get your API key from there. A free kind of subscription is available there.

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

Open up a new console. [Install Node.js](https://nodejs.org/en/), unless you already have it on your system. Ensure that Node.js and its package manager are properly installed. If everything is fine then the console will output their version numbers:
```
nodejs --version
# v12.18.2
# If the above doesn't work, try:
node --version
# v12.18.2

npm --version
# 6.14.5
```

The version of `nodejs` should be no older than 10.0. The version of `npm` is not important. Consider this article: [How to Update Node.js](https://phoenixnap.com/kb/update-node-js-version).

Now install the necessary packages by issuing this command:

```sh
npm install --dev
```

Install [Parcel](https://parceljs.org/), a web application packer, which is similar to [Webpack](https://webpack.js.org/), but requires no setting up:

```sh
npm install -g parcel@latest  # понадобятся права администратора `sudo`
```

You need the second version of Parcel. Make sure that `parcel` is installed and check its version in the command line:

```sh
$ parcel --version
2.0.0-beta.2
```

Almost all is ready. Now proceed to building the frontend:

```sh
parcel watch bundles-src/index.js --dist-dir bundles --public-url="./"
```

Once done, the console will output:

```
✨  Built in 10.89s
```

Now if you go to [http://127.0.0.1:8000/](http://127.0.0.1:8000/), then, instead of a blank page, you should see this:

![](https://dvmn.org/filer/canonical/1594651900/687/)

## Automatic deploy

You can use the deploy script `deploy.sh` on the server after installing `nginx` and `gunicorn` on the server. Once these are installed, run

    sudo ./deploy.sh

within the project directory. This script assembles the frontend, collects Django statics, downloads the project from github, applies Django
database migrations, installs the Python requirements (libraries) for the project, and restarts the star-burger systemd service.

## How to launch the production version of the website

Assemble the frontend:

```sh
parcel build bundles-src/index.js --dist-dir bundles --public-url="./"
```

Set up the backend: create the file `.env` in the directory `star_burger/` with the following settings:

- `ALLOWED_HOSTS` — a list of server IPs *from* which it will be allowed to serve the website.

   Example (must exactly correspond to this format): `ALLOWED_HOSTS=127.0.0.1,localhost` 
- `DJANGO_SETTINGS_MODULE` — path to the Django settings.
- `DEBUG` — the debug mode. Set it to `False`.
- `POSTGRES` — a one-URL database setting specifier.

  Example:
  `POSTGRES="postgres://starburger:password@localhost/starburger"`
- `ROLLBAR_KEY` — your API key for Rollbar.
- `SECRET_KEY` — the project secret key for Django. It is responsible for the encryption on the website. For example, it is used to encrypt all passwords on your website. It is not recommended to use the default value, **update it to your own value**.
- `YANDEX_GEOCODER_API_KEY` - the API-key for the Yandex Geocoder service. The service is used for calculating of the distances between the restaurants and their clients. The key can be obtained at [this address](https://developer.tech.yandex.ru/).
