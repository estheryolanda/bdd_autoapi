import random
import string


def get_random_string(length):
    """
    Get random string
    :param length: number lenght of the string to be generated
    """
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str