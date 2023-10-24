#cython: language_level=3

from ..common.pure import NAME 

print(NAME)

cdef color_picker():
    cdef Color x = Color.RED
    if x == Color.RED:
        return "red"
    elif x == Color.GREEN:
        return "green"
    elif x == Color.BLUE:
        return "blue"
    else:
        return "unknown"

cpdef test_print():
    output = color_picker()
    print(output)

def square(float x):
    return x * x

