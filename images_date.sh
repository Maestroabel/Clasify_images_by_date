#!/usr/bin/env bash

#set -euo pipefail

echo -e "Ruta actual: $(pwd)"


#i=0
#while [ $i -ne 9 ]
#do
#        i=$(($i+1))
#	ls -1 | grep "20210$i"
#done

function create_folder_by_date() {
for j in {14..20}
do

	for i in {01..12}
	do 
		ls -1 | grep -o "20${j}${i}" | awk '!a[$0]++' | xargs mkdir 

	done

done

return 0
}

function move_images_to_date() {
for j in {14..20}
do
	for i in {01..12}
	do
		mv IMG_20${j}${i}* 20${j}${i}
	done
done

return 0
}

function move_FolderMonth_to_FolderAge() {
for i in {14..20}
do
	mkdir 20${i}
	mv -v 20${i}* 20${i}/.
done

return 0
}

create_folder_by_date

move_images_to_date

move_FolderMonth_to_FolderAge

echo -e "\e[1;32m !------------------------------------------------------------------------------------!\e[0m"
echo -e "\e[1;32m        PROGRAMA EJECUTADO CON EXITO!, CARPETAS CREADAS E IMAGENES MOVIDAS SEGUN FECHA \e[0m"
echo -e "\e[1;32m !------------------------------------------------------------------------------------!\e[0m"

