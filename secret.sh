#!/bin/bash

db_user="CHANGE ME" # Database  login in the format of "user:pw". Quotes included
db_ip="CHANGE ME"   # Database local ip such as 192.168.1.11, without http. Quotes not included
db_port="CHANGE ME" # Database port such as 5432. Quotes not included

# start script |   folder    |  conda_env  | port |          database info         |     log file location
./st_starter.sh -f my_dash    -e covid_env -p 8501 -u $db_user -i $db_ip -r $db_port >> ~/streamlit_starter/log_covid.txt
./st_starter.sh -f portfolio  -e port_env  -p 8502 -u $db_user -i $db_ip -r $db_port >> ~/streamlit_starter/log_port.txt
