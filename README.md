# Description

A bash script to start streamlit scripts in the background.

# How-to

* Assumed folder layout

```
|-- home
    |-- projects
        |-- streamlit_project1
            |--streamlit_project1.py
        |-- streamlit_project2
            |--streamlit_project2.py
        |-- streamlit_project1
            |--streamlit_project3.py
    |-- scripts
        |-- st_starter.py
        
```

* All streamlit scripts are assumed to be in a `~/projects/streamlit_script_folder` directory. To run the bash script:
* The script folder is assumed to be the name of the script as well. So `my_dash.py` is assumed to be in the `my_dash` folder

```
./st_starter.sh -f script_folder -e script_env -p 8501
```

# Crontab

Add the following line at the end of `crontab -e` to have the script started on each reboot

```
@reboot /bin/bash ~/st_starter.sh -f script_folder -e script_env -p 8501 >> ~/scripts/script_log.txt
```
