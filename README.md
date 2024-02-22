# libmongoc-dev-symlinks

Create symlinks for libbson and libmongoc header directories, so they can be used without `pkgconf`.

This will work without any `-I` or `-isystem` options, like everything else:

```c
#include <bson/bson.h>
#include <mongoc/mongoc.h>
```
