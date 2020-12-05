# Description

A bash script to start streamlit scripts in the background.

# How-to

## Run the script

For purposes of this script, your streamlit projects are assumed to be in their own folders within one `projects` folder in the home directory:

```
|-- home
    |-- projects
        |-- streamlit_project1 # folder name matches script name. Will store project log (nohup.txt)
            |--streamlit_project1.py # script name matches folder name
        |-- streamlit_project2
            |--streamlit_project2.py
        |-- streamlit_project3
            |--streamlit_project3.py
    |-- streamlit_starter # cloned repo
        |-- st_starter.sh
    |-- scripts # crontab logs are stored here
        
```

To start one project in the background, first the script must be made an executable:

```
cd streamlit_starter
sudo chmod +x st_starter.sh
```

Then just go in the cloned repo and start the script with the appropriate tags

```
./st_starter.sh -f my_dash -e dash_env -p 8501
```
* `-f`: folder name, assumed to be the streamlit python script name as well
* `-e`: environment name, assumed that each streamlit project has its own environment
* -`p`: port you would like to access the streamlit project at
* -`h`: show the help page of `st_starter.sh`, which lists the different flags

Each streamlit project will have a `nohup.txt` created, this is the log.

## Kill the streamlit instance

There's a couple options to kill streamlit instances:

```
# View streamlit instances running in the background, but it will not show the name
ps -C streamlit

# Kill a specific streamlit instance
pkill -f my_dash.py

# Kill all streamlit instances
killall -C streamlit
```

# Run at Startup with Crontab

Customize then add the following line at the end of `crontab -e` to have the script started on each reboot. A crontab line is needed for each script.

* The following will run `my_dash.py` on at `localhost:8501` in the `dash_env` environment every time the OS is rebooted. All terminal outputs are stored in `scripts/dash_log.txt`

```
@reboot /bin/bash ~/streamlit_starter/st_starter.sh -f my_dash -e dash_env -p 8501 >> ~/scripts/dash_log.txt
```
