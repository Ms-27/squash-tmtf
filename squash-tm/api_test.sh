#!/bin/sh

test_command=`curl -sL -w "%{http_code}" "http://localhost:8080/squash/api/rest/latest/" -o /dev/null`
echo ${test_command}

if [ $test_command -ge "200" ] && [ $test_command -le "412" ] ; then
	echo "OK" ;
else
	echo "KO" ;
fi