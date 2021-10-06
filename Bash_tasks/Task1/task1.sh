#!/bin/bash

datasets_table_name='labelled_newscatcher_dataset.csv'

# reading named arguments
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            workers_cnt)              workers_cnt=${VALUE} ;;
            links_column_name)    links_column_name=${VALUE} ;;
            path_to_save)    path_to_save=${VALUE} ;;     
            *)   
    esac    
done


link_header_id=$(head -n 1 $datasets_table_name | tr -s ';' '\n' | nl -nln | grep -w "$links_column_name" | cut -f1)

links=($(cut -d ';' -f $link_header_id $datasets_table_name))


(mkdir -p "$path_to_save" && cd "$_" && echo "${links[@]:1:10}" | xargs -P "$workers_cnt" -n 1 curl --create-dirs -O)