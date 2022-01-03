#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import sys

from environs import Env

env = Env()
env.read_env()


def main():
    DJANGO_SETTINGS_MODULE = env.str("DJANGO_SETTINGS_MODULE")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
