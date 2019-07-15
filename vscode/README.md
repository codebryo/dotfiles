VScode backups
==============

## General Settings

Copy and Paste between the code view of VScode settings.

## Extensions

Export list of extensions:

```script
$ code --list-extensions
```

copy to `extensions.txt` to keep the list of wanted extensions up-2-date.

Install extensions:

```script
$ cat extensions.txt |% { code --install-extension $_}
```
