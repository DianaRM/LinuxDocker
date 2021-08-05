#!/bin/bash
opcion=0
while :
do :
    read -p "Por favor ingrese una opcion [1-4]" opcion

    case $opcion in
        1) echo "build image"
        2) echo "pull image"
        3) echo "run container"
        4) echo "run yml"
        5) echo "Salir"
            exit 0

done
