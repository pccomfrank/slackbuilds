
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
zcat ${SB_PATCHDIR}/GConf-2.18.0.1-reload.patch.gz | patch -p1 -E --backup --verbose
zcat ${SB_PATCHDIR}/GConf-gettext.patch.gz | patch -p1 -E --backup --verbose

set +e +o pipefail
