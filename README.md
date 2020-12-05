# Description

A bash script to start streamlit scripts in the background.

# How-to

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
        |-- st_starter.py
    |-- scripts # crontab logs are stored here
        
```

* The script folder is assumed to be the name of the script as well. So `my_dash.py` is assumed to be in the `my_dash` folder

```
cd streamlit_starter
./st_starter.sh -f script_folder -e script_env -p 8501
```

# Crontab

Customize then add the following line at the end of `crontab -e` to have the script started on each reboot. A crontab line is needed for each script.

```
@reboot /bin/bash ~/streamlit_starter/st_starter.sh -f script_folder -e script_env -p 8501 >> ~/scripts/script_log.txt
```
