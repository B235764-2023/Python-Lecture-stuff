#!/bin/bash
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
