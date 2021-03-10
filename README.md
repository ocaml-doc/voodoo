To run locally:

```
$ voodoo-prep
$ voodoo-link compile
$ make -f Makefile.mlds compile
$ make -f Makefile.gen compile
$ make -f Makefile.mlds link
$ make -f Makefile.link link
$ for i in `find . -name "*.odocl"`; do odoc html-generate $i -o html; done
$ odoc support-files -o html
```
