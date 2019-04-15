#!/bin/bash

sed 's?__WORKING_DIRECTORY__?'$(pwd)'?g' please-open-it.service > /lib/systemd/system/please-open-it.service
systemctl enable please-open-it.service
systemctl start please-open-it.service