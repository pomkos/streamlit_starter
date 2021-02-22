#! /bin/bash

for my_env in box_env bro_env covid_env mess_env port_env tip_env travel_env wfh_env
do
    source ~/anaconda3/etc/profile.d/conda.sh
    conda activate $my_env # activate the new conda env
    pip install streamlit --upgrade
    conda deactivate
    echo $my_env "updated!"
done
exit 0

echo "Streamlit in all environments updated"
