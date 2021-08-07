#! /bin/bash

build_image(){
    read -p "Ingrese la ruta del docker file " ruta
    read -p "Ingrese el nombre de la imagen " nombre_imagen
    read -p "Ingrese la version de la imagen " version

    printf "%s\n" "Entrando a la ruta $ruta"
    printf "%s\n" "Ejecutando docker build"

    cd $ruta
    pwd
    docker build -t $nombre_imagen:$version .

    status=$?

    if [ $status -eq 0 ]
    then 
        echo "La imagen se ha creado exitosamente"
    else
        echo "NO se creo exitosamente la imagen"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}


pull_image(){
    url=""
    read -p "Ingresa la URL de la imagen " url
    docker pull $url

    status=$?

    if [ $status -eq 0 ]
    then 
        echo "La imagen se ha descargado exitosamente"
    else
        echo "No se descargo exitosamente la imagen"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}

run_container(){
    read -p "Ingrese el nombre del contenedor" nombre_container
    read -p "Ingrese el puerto en el host" puerto_host
    read -p "Ingrese el puerto en el contenedor" puerto_container
    read -p "Ingrese el nombre de la imagen" nombre_image

    docker run --name $nombre_container -d -p $puerto_host:$puerto_container $nombre_image

    status=$?

    if [ $status -eq 0 ]
    then 
        echo "El contenedor se ha desplegado exitosamente"
    else
        echo "No se ha desplegado exitosamente"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}

run_yml(){
    read -p "Ingrese la ruta de la carpeta  " ruta_carpeta
    cd $ruta_carpeta
    docker-compose up -d
    status=$?

    if [ $status -eq 0 ]
    then 
        echo "Docker compose corrio exitosamente"
    else
        echo "No se corrio exitosamente el DOocker compose"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}


list_images(){
    printf "%s\n" "Estas es la lista de images: "
    docker images
    read -n 1 -s -r -p "Presione enter para continuar"
}

remove_images(){
    read -p "Ingrese el id de la imagen  " id_image
    docker image rmi $id_image 

    #$?: guarda la salida del ultimo comando utilizado, 0 si es exitoso y 1 si es fallido  
    status=$?

    if [ $status -eq 0 ]
    then 
        echo "Se ha elimando la imagen existosamente"
    else
        echo "No se ha elimando la imagen"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}

list_containers(){
    printf "%s\n" "Estas es la lista de contenedores: "
    docker container ps -a 

    read -n 1 -s -r -p "Presione enter para continuar"
}

remove_containers(){
    read -p "Ingrese el id del contenedor  " id_container
    docker container stop $id_container
    docker container rm $id_container

    status=$?

    if [ $status -eq 0 ]
    then 
        echo "Se ha elimando el contenedor exitosamente"
    else
        echo "No se ha elimando el contenedor"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}


list_docker_compose(){
    read -p "Ingrese la ruta donde se encuentra el archivo yml" ruta
    printf "%s\n" "Esta es la lista de contonedores desplegados por el docker-compose"
    cd $ruta
    docker-compose ps

    read -n 1 -s -r -p "Presione enter para continuar"
}

remove_docker_compose(){
    read -p "Ingrese la ruta donde se encuentra el yml file " ruta
    cd $ruta
    #ELimina todos los contenedores desplegados en el yml file 
    # -- rmi elimina todas las imagenes asociadoas a esos contenedores
    docker-compose down --rmi all --volumes 

    status=$?

    if [ $status -eq 0 ]
    then 
        echo "Se ha elimando el docker-compose"
    else
        echo "No se ha elimando el docker-compose"
    fi

    read -n 1 -s -r -p "Presione enter para continuar"
}


opcion=0
while :
#Limpiar la pantalla
    clear
    #Desplegar el menú de opciones
    echo "_______________"
    echo "             DOCKER MANAGEMENT           "
    echo "_______________"
    echo "                MENÚ PRINCIPAL           "
    echo "_______________"
    echo "1. Construir una imagen"
    echo "2. Descargar una imagen"
    echo "3. Levantar un contenedor"
    echo "4. Levantar un docker compose"
    echo "5. Listar las imagenes"
    echo "6. Eliminar una imagen"
    echo "7. Listar los contenedores"
    echo "8. Eliminar un contenedor"
    echo "9. Listar los contenedores desplegados "
    echo "10. Eliminar el contenedor "
    echo "11. Salir"

do :
    read -p "Por favor ingrese una opcion [1-9] " opcion

    case $opcion in

        1) build_image 
           ;;
        2) pull_image
            ;;
        3) run_container
            ;;
        4) run_yml
            ;;
        5) list_images
            ;;
        6) remove_images
            ;;
        7) list_containers
            ;;
        8) remove_containers
            ;;
        9) list_docker_compose
            ;;
        10) remove_docker_compose
            ;;
        11) echo "Salir"
            exit 0
            ;;
    esac
done
