#!/bin/bash

# reading named arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -i|--input)
      INPUT="$2"
      shift # past argument
      shift # past value
      ;;
    -t|--train_ratio)
      TRAIN_RATIO="$2"
      shift # past argument
      shift # past value
      ;;
    -y|--y_column)
      Y_COLUMN="$2"
      shift # past argument
      shift # past value
      ;;
    --default)
      DEFAULT=YES
      shift # past argument
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done

# echo $INPUT
# echo $TRAIN_RATIO
# echo $Y_COLUMN

split_dataset() {
    count=$(wc -l <"$1")
    ((count--))
    train_cnt=$(( $2 * count / 100))
    test_cnt=$(( count - train_cnt ))
    head -n $(($train_cnt + 1)) "$1" > "$3"
    head -n 1 "$1" > "$4"
    tail -n $test_cnt "$1" >> "$4"
}


split_dataset $INPUT $TRAIN_RATIO "./train.csv" "./test.csv"
