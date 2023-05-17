content="jetty"
path="pom.xml"

for f in $(ls $path);
do
  nl=`cat $f | grep -i "$content" | wc -l`
  if [ $nl -ne 0 ];
  then
   echo $f
   cat $f | grep "$content"
  fi
done
