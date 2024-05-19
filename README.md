# Example of rules_python #1906

https://github.com/bazelbuild/rules_python/issues/1906

1.  Clone this repo.
1.  Run `bazel build --nobuild //...`
1.  See error.

Note: Run `bazel clean --expunge` between things.

Turns out the bug is https://github.com/jupyter/qtconsole/issues/529 and the
fix is https://github.com/jupyter/qtconsole/commit/8179ac8c696db2b3ea4df59f44095280a1a059ff.


## Playing Around

1.  Edit `requirements.in` to use `qtconsole == 5.3.1` (or another version).
1.  Run `source update_reqs.sh`.
1.  Run `bazel build --nobuild //...` and see if the error happens. For
    `qtconsole >= 5.3.1`, no error!

Might be easier to run:

```shell
source update_reqs.sh && bazel clean --expunge && bazel build --nobuild //...
```
