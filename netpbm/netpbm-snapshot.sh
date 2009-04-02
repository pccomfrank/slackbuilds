#!/bin/bash

set -e

module=$(basename $0 -snapshot.sh)
snaproot="https://netpbm.svn.sourceforge.net/svnroot/${module}/stable"
snaproot2="https://netpbm.svn.sourceforge.net/svnroot/${module}/userguide"

tmp=$(mktemp -d)

trap cleanup EXIT
cleanup() {
  set +e
  [ -z "${tmp}" -o ! -d "${tmp}" ] || rm -rf "${tmp}"
}

unset CDPATH
pwd=$(pwd)
snap=${snap:-$(date +%Y%m%d)}

[ "${snap}" = "$(date +%Y%m%d)" ] || SNAP_COOPTS="-r {$snap}"

pushd "${tmp}"
  svn checkout ${SNAP_COOPTS} ${snaproot} ${module}-${snap}
  svn checkout ${SNAP_COOPTS} ${snaproot2} ${module}-${snap}/userguide
  pushd ${module}-${snap}
    find . -type d -name .svn -print0 | xargs -0r rm -rf
  popd
  tar -jcf "${pwd}"/${module}-${snap}.tar.bz2 ${module}-${snap}
popd >/dev/null
