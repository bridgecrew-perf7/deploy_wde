#!/usr/bin/env bash
. env.sh

if [[ "$#" -ne 2 ]]; then
echo "Para ejecutar el script"
echo "se deben para la carpeta"
echo "como primer parametro"
echo "y el archivo .zip como"
echo "segundo paramentro"
exit 1
fi
enviroment $1
site




