Bash Flatten Folder script
==========================

Script that converts file tree into flat folder. File names in flat folder reflect their place in file tree. For example dir1/dir2/file will be renamed to dir1__dir2__file

It is useful for example for android developers. Android SDK doesn't support inner folders in drawable-Xdpi. But quite serious design includes lots of sliced images, that is usually grouped into folders. So here are two advantages of such a script: you shouldn't copy all files to the root directory manually and it saves the structure of files


Options
-------

- `-s DIR, --src DIR` Specify the source directory. By default it is set to `./`
- `-d DIR, --dst DIR` Specify the destination directory. By default it is set to `OUTPUT`
- `-D DELIMITER`  Specify the delimiter that is used to replace `/` when converting file names. By default it is set to `__`

Usage
-----

For example we have a `design` folder with the following structure:

```
$ tree ./design
./design
├── hdpi
│   ├── contacts
│   │   ├── ic_add_contact.png
│   │   └── ic_edit_contact.png
│   ├── home
│   │   ├── ic_logout.png
│   │   └── ic_menu_main.png
│   ├── logo.png
│   ├── settings
│   │   ├── ic_department.png
│   │   └── img_profile_photo.png
│   └── tutorial.png
└── mdpi
    ├── contacts
    │   ├── ic_add_contact.png
    │   └── ic_edit_contact.png
    ├── home
    │   ├── ic_logout.png
    │   └── ic_menu_main.png
    ├── logo.png
    ├── settings
    │   ├── ic_department.png
    │   └── img_profile_photo.png
    └── tutorial.png
```

There is a `flatten_drawables.sh` script:
```
#!/bin/bash

OUTPUT_FOLDER=OUTPUT
DESIGN_FOLDER=design

rm -rf $OUTPUT_FOLDER

for dpi in hdpi  mdpi  xhdpi  xxhdpi;
do
  ./flatten_folder.sh --src $DESIGN_FOLDER/$dpi  --dst $OUTPUT_FOLDER/$dpi
done
```

This script converts the previous structure to 

```
$ tree OUTPUT/
OUTPUT/
├── hdpi
│   ├── contacts__ic_add_contact.png
│   ├── contacts__ic_edit_contact.png
│   ├── home__ic_logout.png
│   ├── home__ic_menu_main.png
│   ├── logo.png
│   ├── settings__ic_department.png
│   ├── settings__img_profile_photo.png
│   └── tutorial.png
└── mdpi
    ├── contacts__ic_add_contact.png
    ├── contacts__ic_edit_contact.png
    ├── home__ic_logout.png
    ├── home__ic_menu_main.png
    ├── logo.png
    ├── settings__ic_department.png
    ├── settings__img_profile_photo.png
    └── tutorial.png
```

