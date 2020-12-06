#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "Starts a streamlit python script."
   echo
   echo "Syntax: scriptTemplate [-h|f|e|p|u|i|r]"
   echo "options:"
   echo "h     Print this Help."
   echo "f     Folder python script is in. Assume script name = folder name"
   echo "e     Conda environment to use."
   echo "p     Port to publish on."
   echo "u    Database user:pw as string"
   echo "i    Database local ip"
   echo "r    Database port"
   echo 
}

################################################################################
# Main program                                                                 #
################################################################################
run_script()
{
    source ~/anaconda3/etc/profile.d/conda.sh

    cd ~/projects/$folder
    conda activate $my_env # activate the new conda env
    nohup streamlit run $folder.py $db_up $db_ip $db_port --server.port $port & # run in background

    echo "Running $folder.py on port $port! "
}


# get options
while getopts ":hf:e:p:u:i:r:" option; do
    case $option in
        h)  # display Help
            Help
            exit;;
        f) folder=${OPTARG};;
        e) my_env=${OPTARG};;
        p) port=${OPTARG};;
	u) db_up=${OPTARG};;
	i) db_ip=${OPTARG};;
	r) db_port=${OPTARG};;
        \?) #incorrect option
            echo "Error: Invalid option"
            exit;;

    esac
done

if [ "$1" == "-f" ]; then
    run_script
else
    echo "The first option should be -f. Please pass -h for more information."
    exit 0
fi
