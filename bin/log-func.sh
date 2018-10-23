#!/bin/bash

############################################################
#### Library for common usage functions

function INFO {
    : << FUNCDOC
This function print the MSG with "INFO:" as prefix, and add newline after MSG

parameter 1: MSG -> message for info

FUNCDOC
    #echo -e "\x1b[92m\x1b[1mINFO\x1b[0m:"
    echo -e "\e[92m\e[1mINFO\e[0m: ${1}"
}

function ERROR {
    : << FUNCDOC
This function print the MSG with "ERROR:" as prefix, and add newline after MSG

parameter 1: MSG -> message for info

FUNCDOC

    echo -e "\e[31m\e[1mERROR\e[0m: ${1}"
}

############################################################
