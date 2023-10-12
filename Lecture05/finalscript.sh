#!/bin/bash
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

