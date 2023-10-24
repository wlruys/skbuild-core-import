Minimal Repository to reproduce relative import issue (https://github.com/scikit-build/scikit-build-core/issues/532)

Steps to reproduce:
```
pip install --no-build-isolation --config-settings=editable.rebuild=true -ve.
python tests/run_example.py
```

Expected result:
```
4.0
EXAMPLE_LIB
```

Error:
```
Traceback (most recent call last):
    from . import impl
  File "impl.pyx", line 7, in init example.nested.impl
ModuleNotFoundError: No module named 'example.nested.common'
```

The issue is that the relative import in `example/nested/impl.pyx` doesn't redirect to the outer directory.
In impl.pyx:

```
#ABSOLUTE_IMPORT (WORKS)
#from example.common.pure import NAME 

#RELATIVE_IMPORT (DOESN'T WORK :( )
from ..common.pure import NAME
```




