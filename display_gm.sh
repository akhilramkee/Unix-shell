#!/usr/bin/sh
awk
'BEGIN{
        printf "Enter the position:"
        getline position < "-"
        FS="|"
	OFS=":"
        a = 0
}
{
        if($3 == position){
                id = $1
                name = $2
		designation=$3
		dept=$4
        print(id,name,designation,dept)
	}
}
END{
        printf("Done")
}'

