#!/usr/bin/awk -f
BEGIN{
	FS = "|"
}
{
	if(length($3))
	   item[$3]+=$6
	   count[$3]+=1
}
END{
	printf("===========================\n")
	printf("Average Salary of the Group\t\n")
	printf("===========================\n")
        for(i in item)
	 print "\t",i," ",item[i]/count[i]
}

