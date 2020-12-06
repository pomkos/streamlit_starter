# Table of Contents
1. [Description](#description)
2. [How-To](#how-to)
    1. [Run the script](#run-the-script)
        1. [Run it once](#run-it-once)
        2. [Run it all at once](#run-it-all-at-once)
    2. [Kill the streamlit instance](#kill-the-streamlit-instance)
3. [Run at Startup with Crontab](#run-at-startup-with-crontab)
    1. [Run one](#run-one)
    2. [Run many](#run-many)

# Description

A bash script to start streamlit scripts in the background. Was created out of a desire to run my various streamlit projects simultaneously, easily, and at ports I wanted them at. Check em out!

* [Portfolio](https://github.com/pomkos/portfolio) #wip
* [Covid Dashboard](https://github.com/pomkos/covid_dash) #wip
* [Venmo Calculator](https://github.com/pomkos/payme) #finished
* [Protein Calculator](https://github.com/pomkos/brotein) #finished

# How-to

## Run the script

For purposes of this script, your streamlit projects are assumed to be in their own folders within one `projects` folder in the home directory:

```
|-- home
    |-- projects
        |-- streamlit_project1 # folder name matches script name. Will store project log (nohup.out)
            |--streamlit_project1.py # script name matches folder name
        |-- streamlit_project2
            |--streamlit_project2.py
        |-- streamlit_project3
            |--streamlit_project3.py
    |-- streamlit_starter # cloned repo
        |-- st_starter.sh # starts streamlit script
        |-- secret.sh # db info, multi-script start. For convenience
    |-- scripts # crontab logs are stored here
        
```

### Run it once

To start one project in the background, first the script must be made an executable:

```
cd streamlit_starter
sudo chmod +x st_starter.sh
```

Then just start the script with the appropriate tags

```
./st_starter.sh -f my_dash -e dash_env -p 8501 -u db_user_pw -i db_ip_address -r db_port
```
* h    Print this Help.
* f    Folder python script is in. Assume script name = folder name
* e    Conda environment to use.
* p    Port to publish on.
* u    Database user:pw as string
* i    Database local ip
* r    Database port

Each streamlit project will have a `nohup.out` created in its folder, this is the log.

### Run it all at once

To start many projects in the background, first make `secret.sh` executable and then edit to add the database user/password, IP, and port.

## Kill the streamlit instance

There's a couple options to kill streamlit instances:

```
# View streamlit instances running in the background, but it will not show the name
ps -C streamlit

# Kill a specific streamlit instance
pkill -f my_dash.py

# Kill all streamlit instances
killall streamlit
```

# Run at Startup with Crontab

Customize then add the following line at the end of `crontab -e` to have the script started on each reboot. A crontab line is needed for each script.

## Run one
The following will run `my_dash.py` on at `localhost:8501` in the `dash_env` environment every time the OS is rebooted. All terminal outputs are stored in `scripts/dash_log.txt`

```
@reboot /bin/bash ~/streamlit_starter/st_starter.sh -f my_dash -e dash_env -p 8501 >> ~/scripts/dash_log.txt
```

## Run many
This will run all scripts that are in the `secret.sh` file at the appropriate ports and in the appropriate environments, each time the OS is rebooted. All terminal outputs will be stored in their respective folders.

```
@reboot /bin/bash ~/streamlit_starter/secret.sh
```
