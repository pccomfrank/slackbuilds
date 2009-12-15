
SB_PATCHDIR=${CWD}/patches

# Disable automount
zcat ${SB_PATCHDIR}/${NAME}-2.24.0-noautomount.patch.gz | patch -p0 -E --backup --verbose || exit 1
# Use browser mode
zcat ${SB_PATCHDIR}/${NAME}-2.26.2-browser-mode.patch.gz | patch -p0 -E --backup --verbose || exit 1
# Some changes to default config
zcat ${SB_PATCHDIR}/${NAME}-config.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-2.5.7-rhconfig.patch.gz | patch -p1 -E --backup --verbose || exit 1

# from upstream
# https://bugzilla.gnome.org/show_bug.cgi?id=589345
zcat ${SB_PATCHDIR}/${NAME}-2.28.1-dynamic-search.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/rtl-fix.patch.gz | patch -p1 -E --backup --verbose || exit 1

zcat ${SB_PATCHDIR}/${NAME}-gvfs-desktop-key-2.patch.gz | patch -p1 -E --backup --verbose || exit 1

# http://bugzilla.gnome.org/show_bug.cgi?id=519743
zcat ${SB_PATCHDIR}/${NAME}-filetype-symlink-fix.patch.gz | patch -p0 -E --backup --verbose || exit 1

# https://bugzilla.gnome.org/show_bug.cgi?id=147808
zcat ${SB_PATCHDIR}/${NAME}-monitor-change.patch.gz | patch -p1 -E --backup --verbose || exit 1
