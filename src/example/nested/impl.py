# ABSOLUTE_IMPORT (WORKS)
# from example.common.pure import NAME

# RELATIVE_IMPORT (DOESN'T WORK)
from ..common.pure import NAME


def test_print():
    print(NAME)


def square(x):
    return x * x
