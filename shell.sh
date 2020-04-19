glibcLocales=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
export LOCALE_ARCHIVE_2_27="${glibcLocales}/lib/locale/locale-archive"
nix-shell
