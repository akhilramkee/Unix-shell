#!/usr/bin/awk -f
function salary(amount,salary_limit){
    if(amount >= 0+salary_limit){
    		return 1
     }
     return 0
}

BEGIN{
    printf "Enter the salary limit:"
    getline salary_limit < "-"
    FS="|"
}
{
	if(salary($6,salary_limit)==1){
		printf("%d\t%s\t%s\n",$1,$2,$3)
	}
}
END{
	printf("Done")
}
