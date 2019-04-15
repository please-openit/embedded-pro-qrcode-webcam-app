#!/bin/bash

/usr/bin/zbarcam --nodisplay --prescale=640x480 /dev/video0 | bash /home/pi/validate-qr-code.sh