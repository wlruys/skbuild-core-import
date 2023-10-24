Minimal Repository to reproduce relative import issue (https://github.com/scikit-build/scikit-build-core/issues/532)

Steps to reproduce:
```
pip install --no-build-isolation --config-settings=editable.rebuild=true -ve.
python tests/run_example.py
```

