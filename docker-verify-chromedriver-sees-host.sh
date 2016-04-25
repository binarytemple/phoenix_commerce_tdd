docker run -ti robcherry/docker-chromedriver:latest ping -c1 $(hostname) > /dev/null

if [ $? == 0 ]
  then echo 'Success - docker instances can ping host';
  exit 0
else 
  echo 'Failure - docker instances cannot ping host';
  exit 1
fi
