#cython: language_level=3

from ..common.pure import NAME 

def test_print():
    print(NAME)

def square(float x):
    return x * x

