import example.nested as impl


def test_square():
    assert impl.square(2) == 4


def test_print(capsys):
    impl.test_print()
    captured = capsys.readouterr()
    assert captured.out == "EXAMPLE_LIB\n"


test_square()
test_print()
