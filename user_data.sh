#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y git
mkdir simple_directory && cd simple_directory && touch simple_file
u+x simple_file
