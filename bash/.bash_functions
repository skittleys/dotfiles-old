# make new directory and cd into it
function mkdcd {
        [[ -n $1 ]] && mkdir -p "$1" && builtin cd "$1"
}

# find one-liner descriptions for available packages
# apt-cache search also provides 1-line descriptions, but does so for every package containing that word in the description or name, not the exact match
# apt-cache show and apt-cache showpackage show info only for that package, but there's TONS of info

function desc {
        if [[ -n $1 ]]; then
                for i in $@
                do 
                        res=$(apt-cache show $i | grep -m 1 "Description\(-en\)\?:" | sed "s/Description\(-en\)\?: //")
                        echo -e "\e[33m$i\e[0m: $res"
                done
        fi
}
