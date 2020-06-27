from django.core.management.base import BaseCommand

import cryptography.fernet


class Command(BaseCommand):
    help = 'Generates a new Fernet encryption key'

    def handle(self, *args, **options):
        key = cryptography.fernet.Fernet.generate_key()
        key_as_str = key.decode('utf-8')
        self.stdout.write(key_as_str)
