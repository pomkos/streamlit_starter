# Description

A bash script to start streamlit scripts in the background.

# How-to

## Run the script

* Assumed folder layout

```
|-- home
    |-- projects
        |-- streamlit_project1 # folder name matches script name
            |--streamlit_project1.py # script name matches folder name
        |-- streamlit_project2
            |--streamlit_project2.py
        |-- streamlit_project3
            |--streamlit_project3.py
    |-- streamlit_starter # cloned repo
        |-- st_starter.sh
    |-- scripts # crontab logs are stored here
        
```

* The script folder is assumed to be the name of the script as well. So `my_dash.py` is assumed to be in the `my_dash` folder

```
cd streamlit_starter
./st_starter.sh -f script_folder -e script_env -p 8501
```

## Kill the streamlit instance

There's a couple options to kill streamlit instance:

```
# View streamlit instances running in the background, but it will not show the name
ps -C streamlit

# Kill a specific streamlit instance
pkill -f my_dash.py

# Kill all streamlit instances
killall -C streamlit
```

# Crontab

Customize then add the following line at the end of `crontab -e` to have the script started on each reboot. A crontab line is needed for each script.

* The following will run `my_dash.py` on at `localhost:8501` in the `dash_env` environment every time the OS is rebooted. All terminal outputs are stored in `scripts/dash_log.txt`

```
@reboot /bin/bash ~/streamlit_starter/st_starter.sh -f my_dash -e dash_env -p 8501 >> ~/scripts/dash_log.txt
```
