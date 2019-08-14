echo "Enter the Mangastream site address:"
read sitename
i=1
adder="/"
header="https:"
Site="$header$sitename$adder$i"
echo "$Site"
curl $Site > page.html
pagecount=`tac page.html|grep -B 50 -m1 "<ul class=\"dropdown-menu\">"|awk '{print $3}'|cut -d '<' -f 1|grep -v '^[[:alpha:]]'|grep '[[:digit:]]'|head -1`
echo "Pagecount:$pagecount"
while [ $i -le $pagecount ]
do
Site="$header$sitename$adder$i"
curl $Site>page.html
image=`cat page.html| grep "img" |cut -d '>' -f 2| cut -d '<' -f 2| awk -F '=' '{print $3}'|cut -d '"' -f 2`
imageAddr="$header$image"
echo "$imageAddr"
curl $imageAddr > "image$i".jpg
i=$((i+1))
done
