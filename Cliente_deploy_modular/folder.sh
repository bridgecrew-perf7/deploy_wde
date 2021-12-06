#!/bin/bash
gdacc=/GdACC
gdaccbin=/GdACC/Bin
gdaccbinproc=/GdACC/Bin/Proc
gdacclog=/GdACC/Log
gdacczip=/GdACC/Zip
gdacczipold=/GdACC/ZipOld
gdaccbackup=/GdACC/Backup
gdacctmp=/GdACC/Tmp
tmp=/tmp
user=u549896
group=root
cd /
if [ $EUID = 0 ]; then
   {
    echo "###################################################################################"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "#                                                                                 #"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "#                     D  E  P  L  O  Y        W  D  E                             #"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "#                                                                                 #"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "###################################################################################"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "# Desarrollado por: Juan Emilio Maydup                                  (TM) 2021 #"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "###################################################################################" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    if [ -d "$gdacc" ]; then
        {
            echo " la carpeta $gdacc ya existe " >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
        }
        else
        {
            mkdir $gdacc && echo "$gdacc Creada" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
        }
    fi
    #####
    if [  -d $gdaccbin ]; then
        {
            echo " la carpeta /GdACC/Bin ya existe " >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
        }
    else
        {
            mkdir $gdaccbin && echo "/GdACC/Bin Creada" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
        }
    fi
    ######
    if  [  -d $gdaccbinproc ]; then
    {
        echo " la carpeta /GdACC/Bin/Proc ya existe " >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir $gdaccbinproc && echo "/GdACC/Bin/Proc Creada"  >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #####
    if  [  -d /GdACC/Log ]; then
    {
        echo " la carpeta /GdACC/Log ya existe " >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir /GdACC/Log && echo "/GdACC/Log Creada"  >>$tmp/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #####
    if [  -d /GdACC/Zip ]; then
    {
        echo " la carpeta /GdACC/Zip ya existe " >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir /GdACC/Zip && echo "/GdACC/Zip Creada" >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #####
    if  [  -d /GdACC/ZipOld ]; then
    {
        echo " la carpeta /GdACC/ZipOld ya existe " >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir /GdACC/ZipOld && echo "/GdACC/ZipOld Creada" >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #####
    if  [  -d /GdACC/Backup ]; then
    {
        echo " la carpeta /GdACC/Backup ya existe " >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir /GdACC/Backup && echo "/GdACC/Backup Creada" >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #####
    if  [  -d /GdACC/Tmp ]; then
    {
        echo " la carpeta /GdACC/Tmp ya existe " >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    else
    {
        mkdir /GdACC/Tmp && echo "/GdACC/Tmp Creada" >> $tmo/GdACC_Create_Folder-$HOSTNAME.log
    }
    fi
    #COPIAR ARCHIVOS .sh
    unzip -l Despliegue.zip -d $gdaccbin >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "Shell Descomprimidos" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "Estructura Creada" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    chmod -R 755 /GdACC && echo  "Permisos OK" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    chown -R $user:$group /GdACC && echo  "Owner OK" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo  "Grupo OK" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
    echo "Permisos Aplicados" >> $tmp/GdACC_Create_Folder-$HOSTNAME.log
	echo "Proceso Exitoso...."
	echo "Validar salida de Log e informar a GdA Contact Center... $tmp/GdACC_Create_Folder-${HOSTNAME}.log"
    mv "$tmp/GdACC_Create_Folder-${HOSTNAME}.log" "$gdacc/GdACC_Create_Folder-${HOSTNAME}.log"
    chmod 777 $gdacc/GdACC_Create_Folder-$HOSTNAME.log
    chown -R $user $gdacc/GdACC_Create_Folder-$HOSTNAME.log
    chgrp -R $group $gdacc/GdACC_Create_Folder-$HOSTNAME.log
    exit 0
    }
else
	 {
    echo "Ejecutar con usuario root" 
    }
fi
