#!/bin/sh

PREFIX=/usr/local/lib/LispWorksPersonal
DOC=1
VERBOSE=0
FILELIST=
LWTAR=lwper61-x86-linux.tar.gz
DOCTAR=lwdoc61-x86-linux.tar.gz

while test $# -gt 0; do
  case "$1" in
    --prefix)
      PREFIX="$2"
      shift
      shift
      ;;
    --excludedocs)
      DOC=0
      shift
      ;;
    -v)
      VERBOSE=1
      shift
      ;;
    *)
      break
      ;;
  esac
done

if test ! -f $LWTAR; then
  echo "Cannot find compressed LispWorks software tar file $LWTAR"
elif test $DOC = 1 -a ! -f $DOCTAR; then
  echo "Cannot find compressed LispWorks documentation tar file $DOCTAR"
elif test $# -ne 0; then
  echo "Usage: $0 [--prefix install-directory] [--excludedocs]"
elif test ! -f "/tmp/."`/bin/date '+%d%m%y'`"lispworksper"`id -u`; then
  echo "*************************************************************"
  echo "* Please run lwlper-license.sh before installing LispWorks. *"
  echo "*************************************************************"
else
  echo Installing LispWorks Personal from `pwd` in $PREFIX
  if mkdir -p $PREFIX; then
    FILELIST=/tmp/lw-files-$$
    if test $VERBOSE = 1; then
      gzip -d < $LWTAR | ( cd $PREFIX; tar xfv - | tee $FILELIST)
    else
      gzip -d < $LWTAR | ( cd $PREFIX; tar xfv - > $FILELIST)
    fi
    if test $DOC = 1; then
      if test $VERBOSE = 1; then
        gzip -d < $DOCTAR | ( cd $PREFIX; tar xfv - | tee -a $FILELIST)
       else
         gzip -d < $DOCTAR | ( cd $PREFIX; tar xfv - >> $FILELIST)
      fi
    fi
    LWFILE="/tmp/."`/bin/date '+%d%m%y'`"lispworksper"`id -u`
    rm "$LWFILE"
    UIDGID=`id -u`:`id -g`
    for FILE in `cat $FILELIST`; do chown $UIDGID $PREFIX/$FILE; done
    rm $FILELIST
  fi
fi
