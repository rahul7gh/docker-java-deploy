#!/bin/bash
help(){
        figlet "SubEnum-DAC" | lolcat
        echo "+++++++++++++++++++++++++"
        echo "-d : Domain as target"
        echo "-f : File as wordlist"
        echo "-h : Help"
        echo "+++++++++++++++++++++++++"
}
check(){
        which host &> /dev/null
        if [ "$?" != "0" ];then
                echo "Please installl host command to run the script"
                exit 1
        fi
}
main(){
        while read -r subs;do
                host "$subs.$target" &> /dev/null
                if [ "$?" == "0" ];then
                echo "$subs.$target : Alive"
                fi
        done < $file
}

while true;do
        case "$1" in
                "-d"|"--domain")
                        target=$2
                        shift
                        ;;
                "-f"|"--file")
                        file=$2
                        shift
                        ;;
                "-h"|"--help")
                        help
                        exit 0
                        ;;
                "")
#                        echo "Error: provide an attribute or check help"
                        break
                        ;;
                *)
                        echo "Error: invalid option: $1"
                        help
                        exit 1
                        ;;
esac
shift
done

if [ -z "$target" ];then
        echo "Domain must required"
        exit 1
fi
if [ -z "$file" ]; then
        echo "File as wordlist is requied"
        exit 1
fi

check
main
