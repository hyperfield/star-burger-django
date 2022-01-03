"""
WSGI config for Django project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

from django.core.wsgi import get_wsgi_application

from environs import Env

env = Env()
env.read_env()


DJANGO_SETTINGS_MODULE = env.str("DJANGO_SETTINGS_MODULE")
application = get_wsgi_application()
