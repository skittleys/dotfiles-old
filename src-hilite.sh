#! /bin/bash

# src-hilite-lesspipe from GNU's source-highlight, with many additions of my own

getpath() {
    echo $(cd $(dirname $fname); pwd)/$(basename $fname);
}

for source in "$@"; do
    case $source in
        *ChangeLog|*changelog) 
            source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=esc.style -i "$source" ;;
        *Makefile|*makefile|*PKGBUILD) 
            source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source" ;;
        *.cfg) 
            source-highlight --failsafe -f esc --lang-def=conf.lang --style-file=esc.style -i "$source" ;;
        *rules)
            fname=$source
            apath=$(getpath)
            if [[ $(getpath) == *"/debian/rules" ]]; then
                source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source"
            else
                source-highlight --failsafe -f esc --infer-lang --style-file=esc.style -i "$source"
            fi
            ;;
        *control)
            fname=$source
            apath=$(getpath)
            if [[ $(getpath) == *"/debian/control" ]]; then
                source-highlight --failsafe -f esc --lang-def=manifest.lang --style-file=esc.style -i "$source"
            else
                source-highlight --failsafe -f esc --infer-lang --style-file=esc.style -i "$source"
            fi
            ;;
        *) source-highlight --failsafe --infer-lang -f esc --style-file=esc.style -i "$source" ;;
    esac
done
