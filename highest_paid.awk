#!/usr/bin/awk -f
BEGIN{
	printf "Enter the position:"
	getline position < "-"
	FS="|"
	a = 0
}
{
	if($3 == position && $6 > a){
		a = $6
		id = $1
		name = $2
		salary = $6
	}
}
END{
	printf("%s\t%s\t%d\n",id,name,salary)
}

