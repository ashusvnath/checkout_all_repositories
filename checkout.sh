#!/bin/bash

repo=$1
filename=$2
if [ -z $filename ]
	then
	filename="step_2014"
fi
declare -a repos_not_found
ctr=0

for i in `cat ${filename}`; do
	git clone https://github.com/${i}/${repo}.git ${repo}/${i}
	if [ $? -ne 0 ]
		then
		repos_not_found[ctr]=${i}
		ctr=${ctr}+1
	fi
done

echo "The repositories of the following accounts were not checked out."
echo "---------------------"
for i in ${repos_not_found[@]}; do
	echo $i
done
echo "---------------------"