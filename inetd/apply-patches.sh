
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${PNAME}-1.79.diff
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/inetd.loopingdos.diff

set +e +o pipefail
