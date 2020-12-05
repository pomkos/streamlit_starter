################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "Starts a streamlit python script."
   echo
   echo "Syntax: scriptTemplate [-h|f|e|p]"
   echo "options:"
   echo "f     Folder python script is in. Assume script name = folder name"
   echo "e     Conda environment to use."
   echo "p     Port to publish on."
   echo "h     Print this Help."
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
    nohup streamlit run $folder.py --server.port $port & # run in background

    echo "Running $folder.py on port $port! "
}


# get options
while getopts ":h:f:e:p:" option; do
    case $option in
        h)  #display help
            Help
            exit;;
        \?) #incorrect option
            echo "Error: Invalid option"
            exit;;
        f) folder=${OPTARG};;
        e) my_env=${OPTARG};;
        p) port=${OPTARG};;
    esac
done

run_script

