#!/bin/bash

set -e

usage()
{
    cat << EOF
Usage: $0 [OPTIONS]
Convert files hierarchy to flat directory. Destination files renamed according to their place in tree.

OPTIONS:
  -s, --src SRC_PATH         specify source directory path. By default it is current directory.
  -d, --dst DST_PATH         specify output directory path. By default it is OUTPUT folder.
  -D DELIMITER               delimiter between path parts instead of '/'. By default it is '__'
  -h, --help                 display this help and exit
  -v                         verbose output

EOF
  
}



while [ "$1" != "" ]; do
    case $1 in
        -s | --src )            shift
                                src=$1
                                ;;
        -d | --dst )            shift
                                dst=$1
                                ;;
        -D )                    shift
                                delimiter=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        -v )                    verbose=true
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done


src=${src:-./}
dst=${dst:-OUTPUT}
delimiter=${delimiter:-__}
verbose=${verbose:-false}

echo "src='$src'; dst='$dst'; delimiter='$delimiter'"

mkdir -p $dst

# get destination absalute path
pushd $dst > /dev/null
dst=$(pwd)
popd > /dev/null
#echo "dst absalute=$dst"

cd $src

find . -type f | while read filename;
do
  # remove prefix "./"
  newname=${filename//\.\//}

  # replace '/' with DELIMITER
  newname=${newname//\//$delimiter}

  if [ "$verbose" = true ] ; then
    echo "rename $filename ---> $newname"
  fi

  cp "$filename" "$dst/$newname"

done



