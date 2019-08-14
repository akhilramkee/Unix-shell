echo "Enter the Mangastream site address:"
read sitename
header="https:"
Site="$header$sitename"
echo "$Site"
curl $Site>page.html
image=`cat page.html| grep "img" |cut -d '>' -f 2| cut -d '<' -f 2| awk -F '=' '{print $3}'|cut -d '"' -f 2`
imageAddr="$header$image"
echo "$imageAddr"
curl $imageAddr > imagex.jpg
