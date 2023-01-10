import random
import string
from django.utils import timezone
from .models import LinkMapping


def shorten(url):
    # create a random 5-letter hash
    random_hash = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(5))
    # assign the entered URL to this hash
    mapping = LinkMapping(original_url=url, hash=random_hash, creation_date=timezone.now())
    # save it into the database
    mapping.save()
    # return the hash
    return random_hash


# load the original URL from the given hash
def load_url(url_hash):
    return LinkMapping.objects.get(hash=url_hash)
