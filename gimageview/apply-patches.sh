
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
zcat ${SB_PATCHDIR}/${NAME}-0.2.27-gtk12_fix.diff.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-0.2.27-gtk2.patch.gz | patch -p0 -E --backup --verbose || exit 1
zcat ${CWD}/${PSRCARCHIVE} | patch -p1 -E --backup --verbose || exit 1
sed -i -e 's|\.dpatch||g' debian/patches/00list
for f in $(<debian/patches/00list ) ;do 
  patch -p1 -i debian/patches/${f}.dpatch || exit 1
done

set +e +o pipefail
