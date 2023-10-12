#!/bin/bash
count=0
while read name email city birthday_day birthday_month birthday_year country
 do
  count=$((count+1))
  echo -e "${count}\t${country}"
 done < example_people_data.tsv | head -10

count=0
IFS=$'\t'
while read name email city birthday_day birthday_month birthday_year country
do
if test -z ${name} 
 then
 echo -e "X\tBlank line found"
 else
 if test ${country} == "country"
  then
  echo -e "X\tHeader line found"
  else
   count=$((count+1))
   echo -e "${count}\t${country}"
 fi  # a real country
fi   # a blank line
done <  example_people_data.tsv

count=0; IFS=$'\t';
while read name email city birthday_day birthday_month birthday_year country
do
if test -z ${name} || test ${country} == "country"
 then
  count=count;# a meaningless action, it does nothing useful
 else
 echo "outputfile1 will be ${country}.details";
  echo "outputfile2 will be ${country// /}.details"
fi
done <  example_people_data.tsv | head -10

count=0; IFS=$'\t';
rm  -f *.details
while read name email city birthday_day birthday_month birthday_year country
do
if test -z ${name} || test ${country} == "country"
 then
 echo "Ignoring"
 else
 count=$((count+1));
# To replace all occurrences of some character use ${parameter//pattern/string}

 echo -e "${count}\t${name}\t$city\t${country}" >> ${country// /}.details
fi
done < example_people_data.tsv

count=0; IFS=$'\t';
rm  -f *.details
while read name email city birthday_day birthday_month birthday_year country
do
if test -z ${name} || test ${country} == "country"
 then
 continue
 else
 count=$((count+1));
outputfile=${country// /}.younger.details
 if test ${birthday_year} -le 1980
   then 
   outputfile=${country// /}.older.details
 fi # birthday before 1980
echo -e "${count}\t${name}\t${birthday_year}\t${country}" >> ${outputfile} 
fi  
done <  example_people_data.tsv

count=0; IFS=$'\t';
month=10
outputfile="Month.$month.details"
rm  -f *.details
while read name email city birthday_day birthday_month birthday_year country
do
if test -z ${name} || test ${country} == "country"
 then
 echo "Ignoring"
 else
 count=$((count+1));
 if test ${birthday_month} -eq $month
   then
   echo -e "${count}\t${name}\t${birthday_month}\t${country}" >> ${outputfile}
 fi # birthday month
fi
done <  example_people_data.tsv


