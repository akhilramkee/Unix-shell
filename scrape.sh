echo "Enter the Mangastream site address:"
read sitename
i=1
adder="/"
header="https:"
Site="$header$sitename$adder$i"
echo "$Site"
curl $Site > page.html
pagecount=`cat page.html|grep "Last Page"|awk -F '<|>' '{print $5}'|awk -F '(' '{print $2}'|cut -d ')' -f 1`
echo "Pagecount:$pagecount"


#Provides you with items required
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

Filename=`echo "$sitename"|awk -F '/' '{print $5"_"$6}'`
#After changing the permissions in /etc/ImageMagick-6/policy.xml
convert $(ls -1 image*.jpg| sort -V) "$Filename".pdf

#Save space
rm image*.jpg
