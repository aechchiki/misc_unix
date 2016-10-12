# Basic operations

**Copy a folder tree without files inside**

```sh
find . -type d | cpio -pdumv </target_folder/>
```



# Environmental variables

destroy that annoying vital-it perl problem message (I think)

```sh
export LC_CTYPE=C 
export LANG=C
```

**alternative tmp folder**

```sh
export TMPDIR=<newpath>
```
