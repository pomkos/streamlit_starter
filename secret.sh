#!/bin/bash

db_user="CHANGE ME"
db_ip="CHANGE ME"
db_port="CHANGE ME"

./st_starter.sh -f payme -e tip_env -p 8501 -u $db_user -i $db_ip -r $db_port >> ~/scripts/log_pay.txt
./st_starter.sh -f brotein -e bro_env -p 8502 -u $db_user -i $db_ip -r $db_port >> ~/scripts/log_bro.txt
./st_starter.sh -f covid_dash -e covid_env -p 8503 -u $db_user -i $db_ip -r $db_port >> ~/scripts/log_covid.txt
./st_starter.sh -f portfolio -e port_env -p 8504  -u $db_user -i $db_ip -r $db_port >> ~/scripts/log_port.txt

