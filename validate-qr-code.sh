#!/bin/bash
gpio mode 6 out;
gpio write 6 0;
while : ; do
  read token
  token=$(echo $token | cut -d':' -f2)
  httpcode=$(curl -s -o /dev/null -w "%{http_code}" https://access.please-open.it/access/ -H 'Authorization: $token' -H 'controllerId: <doorId>' )

  if [ $httpcode = 200 ]; then
      echo "access OK"
      play success.wav &
      gpio write 26 1
      sleep 2
      gpio write 26 0
  else
      echo "access denied"
      play error.wav &
    fi
done;
