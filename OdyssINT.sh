#!/bin/bash

#$comando 2>&1 | log  "Imprimir en los logs el propio comando que se está lanzando para tener una trazabilidad:"
# | log "Solo para echo. Imprimir a log y que no aparezcan en pantalla"
# | tee -a >(log) 2>&1 "Solo para echo. Imprimir a log y que aparezcan en pantalla"

# Colores
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[1;35m\033[1m"
cyan="\e[0;36m\033[1m"
white="\e[0;37m\033[1m"
black="\e[0;30m\033[1m"

# Bold High Intensity
bgreen='\033[1;92m'
bred='\033[1;91m'
bblue='\033[1;94m'
byellow='\033[1;93m'
bpurple='\033[1;95m'
bcyan='\033[1;96m'
bwhite='\033[1;97m'
bblack='\033[1;90m'

# Subrayados
ugreen='\033[4;32m'
ured='\033[4;31m'
ublue='\033[4;34m'
uyellow='\033[4;33m'
upurple='\033[4;35m'
ucyan='\033[4;36m'
uwhite='\033[4;37m'
ublack='\033[4;30m'

# High Intensity
igreen='\033[0;92m'
ired='\033[0;91m'
iblue='\033[0;94m'
iyellow='\033[0;93m'
ipurple='\033[0;95m'
icyan='\033[0;96m'
iwhite='\033[0;97m'
iblack='\033[0;90m'

# Background
Bgreen='\033[42m'
Bred='\033[41m'
Bblue='\033[44m'
Byellow='\033[43m'
Bpurple='\033[45m'
Bcyan='\033[46m'
Bwhite='\033[47m'
Bblack='\033[40m'

# High Intensity backgrounds
ogreen='\033[0;102m'
ored='\033[0;101m'
oblue='\033[0;104m'
oyellow='\033[0;103m'
opurple='\033[0;105m'
ocyan='\033[0;106m'
owhite='\033[0;107m'
oblack='\033[0;100m'

#Especiales
end="\033[0m\e[0m"
warning="\e[5;31m\033[1m"

#Función para mostrar el banner inicial.
function mostrar_banner() {
	# Limpia la pantalla
	clear
	color=$(color_random)
	echo -e "${bred}"
	#echo -e "${color}"
	echo -e "        ███████        █████                            █████ ██████   █████ ███████████    "
	echo -e "      ███░░░░░███     ░░███                            ░░███ ░░██████ ░░███ ░█░░░███░░░█    "
	echo -e "     ███     ░░███  ███████  █████ ████  █████   █████  ░███  ░███░███ ░███ ░   ░███  ░     "
	echo -e "    ░███      ░███ ███░░███ ░░███ ░███  ███░░   ███░░   ░███  ░███░░███░███     ░███        "
	echo -e "    ░███      ░███░███ ░███  ░███ ░███ ░░█████ ░░█████  ░███  ░███ ░░██████     ░███        "
	echo -e "    ░░███     ███ ░███ ░███  ░███ ░███  ░░░░███ ░░░░███ ░███  ░███  ░░█████     ░███        "
	echo -e "    ░░░███████░  ░░████████ ░░███████  ██████  ██████  █████ █████  ░░█████    █████        "
	echo -e "       ░░░░░░░     ░░░░░░░░   ░░░░░███ ░░░░░░  ░░░░░░  ░░░░░ ░░░░░    ░░░░░    ░░░░░        "
	echo -e "                              ███ ░███                                                      "
	echo -e "                             ░░██████                                                       "
	echo -e "                              ░░░░░░                                                        "
	echo -e
	echo -e "  \t\t   Script de instalación y uso de herramientas OSINT"${end}
	echo -e "  \t"
	echo -e "  \t\t\t  ${bgreen}Master Ciberseguridad 12ª Edición "${end}
	echo -e "  \t\t\t  Autor: ${bblue}Javier Aguilar"${end}
	echo -e "  \t\t\t  Tutor: ${cyan}Juanjo Salvador"${end}
	# Muestra la versión actual del script y si hay actualizaciones o errores.
	echo -e "  \t\t\t  Versión ${blue}$script_version${end}${warning} $script_version_update"${end}
	echo -e "  \t\t\t  Última modificación: ${blue}15-03-2024"${end}
	# Comprueba si eres Root
	if [ "$UID" -eq 0 ]; then
		echo -e "  \t\t\t  ROOT: [${bgreen}${tick}${end}]"
	else
		echo -e "  \t\t\t  ROOT: [${bred}${cross}${end}]"
	fi
	echo -e
	#echo -e "Colores:"
	#echo -e "Normal ${green}green,${red}red,${blue}blue,${yellow}yellow,${purple}purple,${cyan}cyan,${white}white,${black}black"${end}
	#echo -e "bcolor ${bgreen}green,${bred}red,${bblue}blue,${byellow}yellow,${bpurple}purple,${bcyan}cyan,${bwhite}white,${bblack}black"${end}
	#echo -e "ucolor ${ugreen}green,${ured}red,${ublue}blue,${uyellow}yellow,${upurple}purple,${ucyan}cyan,${uwhite}white,${ublack}black"${end}
	#echo -e "icolor ${igreen}green,${ired}red,${iblue}blue,${iyellow}yellow,${ipurple}purple,${icyan}cyan,${iwhite}white,${iblack}black"${end}
	#echo -e "Bcolor ${Bgreen}green,${Bred}red,${Bblue}blue,${Byellow}yellow,${Bpurple}purple,${Bcyan}cyan,${Bwhite}white,${Bblack}black"${end}
	#echo -e "ocolor ${ogreen}green,${ored}red,${oblue}blue,${oyellow}yellow,${opurple}purple,${ocyan}cyan,${owhite}white,${oblack}black"${end}
	#echo -e "Especiales: ${warning}alerta"${end}
}

# Variables
# Requerimientos OdyssINT
declare requerimientos=("git" "python3" "python3-pip" "python3-virtualenv" "nodejs" "firefox" "openjdk-17-jdk" "curl" "wget")
declare odyssint_github_url="https://raw.githubusercontent.com/javi-ag/OdyssINT/main/OdyssINT"
declare script_version=1.1
#Directorio de trabajo de OdyssINT
declare odyssinthome=$HOME/odyssint
declare tick=✔
declare cross=✘

# Nombre del archivo de log
#declare logfile="$odyssinthome/logs/$(date +'%Y-%m-%d-%H-%M')-OdyssINT.log"
declare logfile="$odyssinthome/logs/$(date +'%Y-%m-%d')-OdyssINT.log"

# Función para escribir en el log con fecha y hora, eliminando los códigos de escape ANSI
function log() {
	while IFS= read -r line; do
		echo "[$(date +'%Y-%m-%d %H:%M:%S')] $(echo "$line" | sed -r "s/\x1B\[[0-9;]*[mGKHJ]//g")" >>"$logfile"
	done
}

# Función para mostrar el menú principal
function mostrar_menu_principal() {

	echo -e ${bpurple}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${opurple}"                                    MENÚ PRINCIPAL                                          "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"--------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}"1. Herramientas OSINT"${end}
	echo -e ${bgreen}"2. Configurar OdyssINT"${end}
	echo -e
	echo -e ${byellow}"s. Salir del script"${end}
	echo -e
	echo -e ${bpurple}"--------------------------------------------------------------------------------------------"${end}
	read -p "Selecciona una opción: " menu_principal

	case $menu_principal in
	1)
		mostrar_banner
		listar_herramientas_osint
		;;
	2)
		mostrar_banner
		listar_configurar_odyssint
		;;
	s)
		mostrar_banner
		mostrar_menu_principal
		;;
	S)
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
	*)
		read -p "$(echo -e "${bred}Opción inválida, pulsa cualquier tecla para continuar"${end}) " confirmacion
		mostrar_banner
		mostrar_menu_principal
		;;
	esac

}

# Función para salir del script
function salir_del_script() {
	echo -e ${byellow}"¿Estás seguro de que quieres salir del script? Presiona 'S/s' para confirmar."${end}
	read -n1 -s tecla
	if [[ $tecla == "S" || $tecla == "s" ]]; then
		echo "¡Hasta pronto!"
		exit
	fi
	mostrar_banner
	mostrar_menu_principal
}

#Función que permite pulsar ctrl+c en cualquier momento.
function ctrl_c() {
	echo
	salir_del_script
	tput cnorm
	exit 0
}

# Función para seleccionar un color aleatorio
function color_random() {
	# Seleccionar un color aleatorio
	# Colores disponibles
	colores=("bred" "bgreen" "bblue" "bcyan" "byellow" "bwhite" "bblack")
	random_color="${colores[RANDOM % ${#colores[@]}]}"
	echo -e "${!random_color}"
}

# Comprobar si la carpeta $odyssinthome existe, si no la crea
function comprobar_directorio() {
	if [ ! -d "$odyssinthome" ]; then
		mkdir -p $odyssinthome
		mkdir -p $odyssinthome/logs/
		mostrar_banner
		echo -e ${bgreen}"Se ha creado el directorio de trabajo en $odyssinthome."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end} 
		read -n 1 -r
	fi
	# Imprimo un primer mensaje en log con inicio y versión de script.
	echo "------------- INICIO EJECUCIÓN SCRIPT - VERSIÓN ACTUAL OdyssINT $script_version -------------" | log
}

# Función para mostrar el menú de herramientas OSINT
function listar_herramientas_osint() {

	echo -e ${bblue}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${oblue}"                                    HERRAMIENTAS OSINT                                      "${end} | tee -a >(log) 2>&1
	echo -e ${bblue}"--------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue} "RECOLECCIÓN DE INFORMACIÓN Y RECONOCIMIENTO"${end}
	echo -e ${bblue} "1. The Harvester"
	echo -e ${blue} "   Recopila información de correos electrónicos, nombres de usuario y subdominios de diferentes"
	echo -e ${blue} "   fuentes online."${end}
	echo -e ${bblue} "2. Recon-ng"
	echo -e ${blue} "   Framework de automatización para tareas de OSINT. Permite ejecutar diferentes módulos"
	echo -e ${blue} "   para recopilar información de forma eficiente."${end}
	echo -e
	echo -e ${bcyan} "ANÁLISIS DE RED"${end}
	echo -e ${bcyan} "3. Spiderfoot"
	echo -e ${cyan} "   Herramienta de recopilación de información online. Escanea IPs, dominios "
	echo -e ${cyan} "   y nombres de usuario para encontrar información relevante.."${end}
	echo -e ${bcyan} "4. Maltego"
	echo -e ${cyan} "   Herramienta que recopila y analiza datos de fuentes abiertas para la realización de investigaciones"${end}
	echo -e ${bcyan} "5. ArchiveBox"
	echo -e ${cyan} "   Potente solución de archivado local de páginas webs para su visualización offline."
	echo -e ${cyan} "   Instalar la extensión de Firefox desde la configuación de OdyssINT."${end}
	echo -e ${bcyan} "6. Zotero"
	echo -e ${cyan} "   Gestor eficiente de referencias bibliográficas para gestionar y citar fuentes en las investigaciones."
	echo -e ${cyan} "   Instalar la extensión de Firefox desde la configuación de OdyssINT."${end}
	echo -e ${bcyan} "7. NExfil"
	echo -e ${cyan} "   Busca nombres de usaurios en más de 350 webs en pocos segundos"${end}
	echo -e ${bcyan} "8. osint-suite-tools"
	echo -e ${cyan} "   Descripción"${end}
	echo -e ${cyan} "9. Firefox - Extensiones"${end}
	echo -e
	echo -e ${byellow} "0. Volver a menú principal"${end}
	echo -e ${byellow} "s. Salir del script"${end}
	echo -e
	echo -e ${bblue}"--------------------------------------------------------------------------------------------"${end}
	echo -e
	read -p "Secciona una opción: " herramientas_osint
	echo -e
	case "$herramientas_osint" in

	1) #theHarvester
		# Verificar si theHarvester está instalado
		if ! command -v $odyssinthome/theharvester/theHarvester.py &>/dev/null; then
			echo -e ${byellow}"theHarvester no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_theHarvester
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación .Compatibilidad con Debian
		if [ -d "$odyssinthome/theharvester/venv/local" ]; then
			venv_path=/local
		fi
		gnome-terminal -- $SHELL -c "source $odyssinthome/theharvester/venv"$venv_path"/bin/activate &&
		cd $odyssinthome/theharvester/ && $odyssinthome/theharvester/theHarvester.py &&
		echo
		echo
		echo ---------------------------------------
		echo ------- OdyssINT - theHarvester -------
		echo ---------------------------------------
		echo      MODO CLI: ./theHarvester.py 
		echo      AYUDA:    ./theHarvester.py -h
		echo ---------------------------------------; exec $SHELL"
		#read -p "$(echo -e "${bgreen}theHarvester iniciado en una nueva ventana.${byellow}\nPulsa cualquier tecla para continuar"${end}) " confirmacion
		echo -e ${bgreen}"theHarvester iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint

		;;

	2) #recon-ng
		# Verificar si Recon-ng está instalado
		if ! command -v $odyssinthome/recon-ng/recon-ng &>/dev/null; then
			echo -e ${byellow}"recon-ng no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_recon-ng
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		if [ -d "$odyssinthome/recon-ng/venv/local" ]; then
			venv_path=/local
		fi
		gnome-terminal -- $SHELL -c "source $odyssinthome/recon-ng/venv"$venv_path"/bin/activate &&
		cd $odyssinthome/recon-ng/ && $odyssinthome/recon-ng/recon-ng -h &&
		echo 
		echo
		echo ----------------------------- 
		echo ---- OdyssINT - recon-ng ----
		echo -----------------------------
		echo  MODO CLI: ./recon-ng 
		echo  MODO WEB: ./recon-web
		echo  AYUDA:    ./recon-web -h
		echo -----------------------------; exec $SHELL"
		echo -e ${bgreen}"Recon-ng iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;

	3) #Spiderfoot
		# Verificar si Spiderfoot está instalado
		if ! command -v $odyssinthome/spiderfoot/sfcli.py &>/dev/null; then
			echo -e ${byellow}"Spiderfoot no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_spiderfoot
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		if [ -d "$odyssinthome/spiderfoot/venv/local" ]; then
			venv_path=/local
		fi
		gnome-terminal -- $SHELL -c "source $odyssinthome/spiderfoot/venv"$venv_path"/bin/activate &&
		python3 $odyssinthome/spiderfoot/sf.py -l 127.0.0.1:5001; exec $SHELL"
		echo -e ${bgreen}"Spiderfoot iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;
	4) #Maltego
		# Verificar si Maltego está instalado
		if ! command -v maltego &>/dev/null; then
			echo -e ${byellow}"Maltego no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_maltego
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		gnome-terminal -- $SHELL -c "maltego; exec $SHELL"
		echo -e ${bgreen}"Maltego iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;
	5) #ArchiveBox
		# Verificar si ArchiveBox está instalado
		if [ ! -d "$odyssinthome/archivebox/" ]; then
			echo -e ${byellow}"ArchiveBox no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_archivebox
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		if [ -d "$odyssinthome/archivebox/venv/local" ]; then
			venv_path=/local
		fi
		gnome-terminal -- $SHELL -c "source $odyssinthome/archivebox/venv"$venv_path"/bin/activate &&
		cd $odyssinthome/archivebox/data && archivebox server 0.0.0.0:8000; exec /bin/bash"
		echo -e ${bgreen}"ArchiveBox iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;
	6) #Zotero
		# Verificar si Zotero está instalado
		if [ ! -f "$odyssinthome/zotero/zotero" ]; then
			echo -e ${byellow}"Zotero no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_zotero
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		gnome-terminal -- $SHELL -c "$odyssinthome/zotero/zotero; exec $SHELL"
		echo -e ${bgreen}"Zotero iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;
	7) #NExfil
		# Verificar si NExfil está instalado
		if ! command -v nexfil &>/dev/null; then
			echo -e ${byellow}"NExfil no está instalado. ¿Desea instalarlo ahora? (s/n)"${end}
			echo -e ${bred}"IMPORTANTE: solicitará root si los requerimientos no están instalados"${end}
			read -n 1 -r -s tecla_confirmacion
			if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
				comprobar_requerimientos
				instalar_nexfil
			else
				mostrar_banner
				listar_herramientas_osint
			fi
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		if [ ! -d "$odyssinthome/nexfil/venv/local" ]; then
			venv_path=venv/bin
		else
			venv_path=venv/local/bin
		fi
		gnome-terminal -- /bin/bash -c "source $odyssinthome/nexfil/$venv_path/activate &&
		nexfil -h; exec $SHELL"
		echo -e ${bgreen}"NExfil iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		mostrar_banner
		listar_herramientas_osint
		;;
	9)
		# Deshabilitar las advertencias de GTK
		export GTK_MODULES=
		firefox -new-tab "about:addons"
		mostrar_banner
		listar_herramientas_osint
		;;
	0)
		mostrar_banner
		mostrar_menu_principal
		;;
	s)
		salir_del_script
		mostrar_banner
		listar_herramientas_osint
		;;
	S)
		salir_del_script
		mostrar_banner
		listar_herramientas_osint
		;;
	*)
		read -p "$(echo -e "${bred}Opción inválida, pulsa cualquier tecla para continuar"${end}) " confirmacion
		mostrar_banner
		listar_herramientas_osint
		;;
	esac

}

# Función para mostrar el menú de configuración de OdyssINT
function listar_configurar_odyssint() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                                 CONFIGURACIÓN OdyssINT                                     "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bgreen} "1. Actualizar el sistema e instalar requerimientos de OdyssINT"${end}
	echo -e ${bgreen} "2. Actualizar script desde GitHub y volver a ejecutar"${end}
	echo -e ${bgreen} "3. Instalar o actualizar todas las herramientas OSINT"${end}
	echo -e ${bgreen} "4. Instalar o actualizar todas las herramientas complementarias"${end}
	echo -e ${bgreen} "5. Instalar o actualizar extensiones firefox"${end}
	echo -e ${bgreen} "6. Instalar o actualizar marcadores en firefox" ${end}
	echo -e ${bred} "7. Desinstalar todo y limpiar instalación de OdyssINT" ${end}
	echo -e
	echo -e ${byellow} "0. Volver a menú principal"${end}
	echo -e ${byellow} "s. Salir del script"${end}
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	read -p "Selecciona una opción: " configurar_odyssint

	case "$configurar_odyssint" in

	1)
		mostrar_banner
		actualizar_sistema_y_requerimientos
		;;
	2)
		mostrar_banner
		actualizar_y_ejecutar_script
		;;
	3)
		mostrar_banner
		instalar_herramientas_osint
		;;
	4)
		mostrar_banner
		instalar_herramientas_complementarias
		;;
	5)
		mostrar_banner
		instalar_extensiones_firefox
		;;
	6)
		mostrar_banner
		instalar_marcadores_firefox
		;;
	7)
		mostrar_banner
		desinstalar_odyssint
		;;
	0)
		mostrar_banner
		mostrar_menu_principal
		;;
	s)
		salir_del_script
		mostrar_banner
		listar_configurar_odyssint
		;;
	S)
		salir_del_script
		mostrar_banner
		listar_configurar_odyssint
		;;
	*)

		read -p "$(echo -e "${bred}Opción inválida, pulsa cualquier tecla para continuar"${end}) " confirmacion
		mostrar_banner
		listar_configurar_odyssint
		;;
	esac

}

# Función para actualizar el sistema e instalar requerimientos
function actualizar_sistema_y_requerimientos() {

	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                      CONFIGURACIÓN OdyssINT > Sistema y requerimientos                     "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e

	echo -e ${bgreen}"Se va a actualizar el sistema e instalar las siguientes aplicaciones requeridas:"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e "-${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e ${red}"IMPORTANTE: Se solicitará permisos de root."${end}
	echo -e
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver."${end}
	read -n 1 -r -s tecla_confirmacion
	if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
		echo -e ${bpurple}"Instalando requerimientos..."${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi

	echo -e ${bpurple}"Actualizando repositorios..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt update" | log
	sudo apt update 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Repositorios actualizados correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar repositorios."${end} | tee -a >(log) 2>&1
	fi

	echo -e ${bpurple}"Actualizando sistema..."${end} | tee -a >(log) 2>&1
	echo -e ${byellow}"Presiona y si no responde."${end}
	echo "--- COMANDO: apt upgrade" | log
	sudo apt upgrade 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Sistema actualizado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar el sistema."${end} | tee -a >(log) 2>&1
	fi

	# Instalar cada aplicación y verificar la instalación
	for app in "${requerimientos[@]}"; do
		echo
		echo -e ${bpurple}"Instalando $app..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: apt-get install -y $app" | log
		sudo apt-get install -y $app 2>&1 | log
		if [ $? -eq 0 ]; then
			echo -e "${bgreen}$app instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar $app. Presiona cualquier tecla para continuar..."${end} | tee -a >(log) 2>&1
			read -n 1 -r -s
		fi
	done
	echo -e ${byellow}"Instalación finalizada, pulsa cualquier tecla para continuar"${end} | tee -a >(log) 2>&1
	read -n 1 -r
	mostrar_banner
	listar_configurar_odyssint
}

# Función para comprobar si el script está actualizado
function comprobar_version() {

	# Intentar leer el archivo desde GitHub
	script_odyssint=$(curl -sSfL "$odyssint_github_url")

	# Verificar si se pudo leer el archivo
	if [ -z "$script_odyssint" ]; then
		declare -g script_version_update="(Comprobar conexión a Internet)"
		mostrar_banner
		echo -e ${bred}"ERROR: No se ha podido verificar el repositorio de OdyssINT."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		return 1
	fi

	# Obtener la versión del script desde el contenido obtenido
	script_version_github=$(echo "$script_odyssint" | grep '^declare script_version=' | cut -d '=' -f 2 | tr -d '"')

	# Verificar si se encontró la versión del script
	if [ -z "$script_version" ]; then
		declare -g script_version_update="(Error script repositorio)"
		mostrar_banner
		echo -e ${bred}"ERROR: No se ha podido verificar la versión del script de OdyssINT."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
		return 1
	fi

	# Comparar versiones
	if [[ "$script_version" == "$script_version_github" ]]; then
		declare -g script_version_update=${end}${bgreen}"(Script actualizado)"${end}
		echo "------------- COMPROBACIÓN DE VERSIÓN CORRECTA - SCRIPT ACTUALIZADO  -------------" | log
		mostrar_banner
	elif [[ "$script_version" < "$script_version_github" ]]; then
		declare -g script_version_update=${bgreen}"(Actualización $script_version_github disponible)"${end}
		mostrar_banner
		echo -e ${bgreen}"Actualización de OdyssINT disponible ($script_version_github), actualiza script desde el menú de configuración."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
	else
		declare -g script_version_update="(Versión de script incorrecta)"
		mostrar_banner
		echo -e ${bred}"ERROR: Versión de script incorrecta ($script_version). Versión actual de OdyssINT ($script_version_github)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Descarga de nuevo el script del repositorio $odyssint_github_url"${end}
		echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
		read -n 1 -r
	fi
}
# Función para actualizar el script desde GitHub y volver a ejecutarlo
function actualizar_y_ejecutar_script() {

	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                      CONFIGURACIÓN OdyssINT > ACTUALIZAR SCRIPT                            "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e

	# Nombre del archivo
	script_name="OdyssINT"

	echo -e ${bgreen}"Se va a actualizar el script desde la versión $script_version a la versión $script_version_github"${end}
	echo -e ${bgreen}"Para comprobar los cambios visitar https://github.com/javi-ag/OdyssINT"${end}
	echo -e ${bred}"IMPORTANTE: Tras actualizarse se reiniciará el script."${end}
	echo -e
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver."${end}
	read -n 1 -r -s tecla_confirmacion
	if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
		echo -e ${bpurple}"Actualizando script..."${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	wget -O "$script_name" "$odyssint_github_url" 2>&1 | log
	chmod +x "$script_name" 2>&1 | log
	echo -e ${bgreen}"Script actualizado a la versión $script_version_github"${end} | tee -a >(log) 2>&1
	echo -e ${byellow}"Pulsa cualquier tecla para volver a ejecutar script"${end}
	read -n 1 -r
	./"$script_name"
}

# Función para instalar todas las herramientas OSINT
function instalar_herramientas_osint() {

	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                         Configurar OdyssINT > Herramientas OSINT                           "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e
	# Lista de aplicaciones a instalar
	aplicacionesOSINT=("theHarvester" "recon-ng" "Spiderfoot" "Maltego" "ArchiveBox")

	echo -e ${byellow}"Se va instalar las siguientes aplicaciones OSINT:"${end}
	for app in "${aplicacionesOSINT[@]}"; do
		echo -e "- ${blue}$app"${end}
	done
	echo -e ${red}"IMPORTANTE: Se tiene que haber ejecutado el primer paso para su correcta instalación."${end}
	echo -e
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver."${end}
	read -n 1 -r -s tecla_confirmacion
	if [[ $tecla_confirmacion == "S" || $tecla_confirmacion == "s" ]]; then
		echo -e ${bpurple}"Iniciando instalación:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		echo -e ${byellow}"Volviendo al menú principal..."${end}
		mostrar_menu_principal
	fi

	#Funciones de instalación de herramientas OSINT
	instalar_theHarvester
	instalar_recon-ng
	instalar_spiderfoot
	instalar_maltego
	instalar_zotero
	instalar_archivebox

	read -p "$(echo -e "${byellow}Instalación finalizada, pulsa cualquier tecla para continuar"${end}) " confirmacion
	mostrar_banner
	mostrar_menu_principal
}

# Función para comprobar e instalar aplicaciones si no están instaladas
function comprobar_requerimientos() {

	echo -e "${bpurple}Comprobando requerimientos..."${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		if ! command -v "$app" &>/dev/null; then
			echo "--- COMANDO: sudo apt-get install -y "$app"" | log
			sudo apt-get install -y "$app" 2>&1 | log
		fi
	done
}

# Función para descargar e instalar theHarvesterDUPLICADOBACKUP
function instalar_theHarvester() {
	if ! command -v $odyssinthome/theharvester/theHarvester.py &>/dev/null; then
		echo -e ${bpurple}"Descargando theHarvester desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester" | log 
		git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester 2>&1 | log
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/theharvester/venv" | log 
		virtualenv -p /usr/bin/python3 $odyssinthome/theharvester/venv 2>&1 | log
		if [ -d "$odyssinthome/theharvester/venv/local" ]; then
			venv_path=/local
		fi
		echo "--- COMANDO: source $odyssinthome/theharvester/venv/bin/activate" | log 
		source $odyssinthome/theharvester/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de TheHarvester
		cd $odyssinthome/theharvester
		# Instalar TheHarvester
		echo -e ${bpurple}"Instalando theHarvester..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: python3 -m pip install -r requirements/dev.txt" | log 
		python3 -m pip install -r requirements/dev.txt 2>&1 | log
		echo "--- COMANDO: python3 -m pip install -r requirements/base.txt" | log 
		python3 -m pip install -r requirements/base.txt 2>&1 | log
		echo -e ${bgreen}"theHarvester instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"theHarvester ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Recon-ng
function instalar_recon-ng() {
	if ! command -v $odyssinthome/recon-ng/recon-ng &>/dev/null; then
		echo -e ${bpurple}"Descargando Recon-ng desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/lanmaster53/recon-ng.git $odyssinthome/recon-ng" | log
		git clone https://github.com/lanmaster53/recon-ng.git $odyssinthome/recon-ng 2>&1 | log
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/recon-ng/venv" | log 
		virtualenv -p /usr/bin/python3 $odyssinthome/recon-ng/venv 2>&1 | log
		if [ -d "$odyssinthome/recon-ng/venv/local" ]; then
			venv_path=/local
		fi
		echo "--- COMANDO: source $odyssinthome/recon-ng/venv"$venv_path"/bin/activate" | log 
		source $odyssinthome/recon-ng/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de Recon-ng
		cd $odyssinthome/recon-ng
		# Instalar Recon-ng
		echo -e ${bpurple}"Instalando Recon-ng..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: python3 -m pip install -r REQUIREMENTS" | log
		python3 -m pip install -r REQUIREMENTS 2>&1 | log
		echo -e ${bgreen}"Recon-ng instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"Recon-ng ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Spiderfoot
function instalar_spiderfoot() {
	if ! command -v $odyssinthome/spiderfoot/sfcli.py &>/dev/null; then
		echo -e ${bpurple}"Descargando spiderfoot desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/smicallef/spiderfoot.git $odyssinthome/spiderfoot" | log
		git clone https://github.com/smicallef/spiderfoot.git $odyssinthome/spiderfoot 2>&1 | log
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/spiderfoot/venv" | log 
		virtualenv -p /usr/bin/python3 $odyssinthome/spiderfoot/venv 2>&1 | log
		if [ -d "$odyssinthome/spiderfoot/venv/local" ]; then
			venv_path=/local
		fi
		source $odyssinthome/spiderfoot/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de Spiderfoot
		cd $odyssinthome/spiderfoot
		# Instalar Spiderfoot
		echo -e ${bpurple}"Instalando Spiderfoot..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install -r requirements.txt" | log 
		pip3 install -r requirements.txt 2>&1 | log
		echo -e ${bgreen}"Spiderfoot instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"Spiderfoot ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Maltego
function instalar_maltego() {
	if ! command -v maltego &>/dev/null; then
		# Descarga e instala Maltego
		echo -e ${bpurple}"Descargando Maltego..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome/maltego https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb" | log  
		wget --directory-prefix=$odyssinthome/maltego https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb 2>&1 | log
		# Cambiar al directorio de Spiderfoot
		cd $odyssinthome/maltego
		# Instalar Maltego
		echo -e ${bpurple}"Instalando Maltego..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: sudo dpkg -i Maltego.v4.6.0.deb" | log 
		sudo dpkg -i Maltego.v4.6.0.deb 2>&1 | log
		echo "--- COMANDO: sudo apt install -f" | log 
		sudo apt install -f 2>&1 | log
		echo -e ${bgreen}"Maltego instalado correctamente."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: rm -rf Maltego.v4.6.0.deb" | log 
		rm -rf Maltego.v4.6.0.deb 2>&1 | log
	else
		echo -e ${bgreen}"Maltego ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar ArchiveBox
function instalar_archivebox() {
	if [ ! -d "$odyssinthome/archivebox/" ]; then
		mkdir -p $odyssinthome/archivebox/ 2>&1 | log
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/archivebox/venv" | log 
		virtualenv -p /usr/bin/python3 $odyssinthome/archivebox/venv 2>&1 | log
		if [ -d "$odyssinthome/archivebox/venv/local" ]; then
			venv_path=/local
		fi
		source $odyssinthome/archivebox/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de ArchiveBox
		cd $odyssinthome/archivebox
		mkdir -p data && cd $odyssinthome/archivebox/data # NO PASAR A LOG
		# Instalar ArchiveBox
		echo -e ${bpurple}"Instalando Archivebox..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install --upgrade archivebox yt-dlp playwright" | log 
		pip3 install --upgrade archivebox yt-dlp playwright 2>&1 | log 
		echo "--- COMANDO: playwright install --with-deps chromium" | log 
		playwright install --with-deps chromium 2>&1 | log
		echo -e ${bpurple}"Inicializando Archivebox..."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"IMPORTANTE: No olvidar usuario y contraseña, necesario para administrar entorno..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: archivebox init --setup | tee -a >(log)" | log
		archivebox init --setup
		wait $!
		echo -e ${bgreen}"ArchiveBox instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"ArchiveBox ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar ArchiveBox2
function instalar_archivebox2() {
	if [ ! -d "$odyssinthome/archivebox/" ]; then
		mkdir -p $odyssinthome/archivebox/ 2>&1 | log
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/archivebox/venv" | log 
		virtualenv -p /usr/bin/python3 $odyssinthome/archivebox/venv 2>&1 | log
		if [ -d "$odyssinthome/archivebox/venv/local" ]; then
			venv_path=/local
		fi
		source $odyssinthome/archivebox/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de ArchiveBox
		cd $odyssinthome/archivebox
		mkdir -p data && cd $odyssinthome/archivebox/data  2>&1 | log
		# Instalar ArchiveBox
		echo -e ${bpurple}"Instalando Archivebox..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install --upgrade archivebox yt-dlp playwright" | log 
		pip3 install --upgrade archivebox yt-dlp playwright 2>&1 | log
		echo "--- COMANDO: playwright install --with-deps chromium" | log 
		playwright install --with-deps chromium 2>&1 | log
		echo -e ${bpurple}"Inicializando Archivebox..."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"IMPORTANTE: No olvidar usuario y contraseña, necesario para administrar entorno..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: archivebox init --setup | tee -a >(log)" | log
		archivebox init --setup
		wait $!
		echo -e ${bgreen}"ArchiveBox instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"ArchiveBox ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Zotero
function instalar_zotero() {
	if [ ! -f "$odyssinthome/zotero/zotero" ]; then
		# Descarga e instala Zotero
		mkdir -p $odyssinthome/zotero
		# Cambiar al directorio de Zotero
		cd $odyssinthome/zotero
		echo -e ${bpurple}"Descargando Zotero..."${end} | tee -a >(log) 2>&1
		wget -O zotero.tar.bz2 "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" 2>&1 | log
		# Instalar Zotero
		echo -e ${bpurple}"Instalando Zotero..."${end} | tee -a >(log) 2>&1
		tar -xjf zotero.tar.bz2 --strip-components=1 2>&1 | log
		./set_launcher_icon
		rm ~/.local/share/applications/zotero.desktop 2>&1 | log
		ln -s $odyssinthome/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
		echo -e ${bgreen}"Zotero instalado correctamente."${end} | tee -a >(log) 2>&1
		rm -rf $odyssinthome/zotero/zotero.tar.bz2 # Borrar la descarga
	else
		echo -e ${bgreen}"Zotero ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar NExfil
function instalar_nexfil() {
	# Instala NExfil
	if [ ! -d "$odyssinthome/nexfil/" ]; then
		mkdir -p $odyssinthome/nexfil/
		#Montar entorno virtual
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		virtualenv -p /usr/bin/python3 $odyssinthome/nexfil/venv 2>&1 | log
		if [ -d "$odyssinthome/nexfil/venv/local" ]; then
			venv_path=/local
		fi
		source $odyssinthome/nexfil/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de NExfil
		cd $odyssinthome/nexfil
		pip install nexfil
		# Instalar NExfil
		echo -e ${bpurple}"Instalando NExfil..."${end} | tee -a >(log) 2>&1
		pip install nexfil 2>&1 | log
		echo -e ${bgreen}"NExfil instalado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bgreen}"NExfil ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar extensiones en Firefox
function instalar_extensiones_firefox() {

	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                         Configurar OdyssINT > Extensiones                                  "${end} | tee -a >(log) 2>&1
	echo -e ${bblue}"--------------------------------------------------------------------------------------------"${end}
	echo -e "\n"

	# Verificar si Firefox está instalado
	if ! command -v firefox &>/dev/null; then
		echo -e ${red}"Firefox no está instalado. Por favor, ejecuta el primer paso del menú para instalarlo."${end}
		return
	fi

	# URL OdyssINT de donde se recogerán las extensiones
	url="https://addons.mozilla.org/es/firefox/collections/18254528/OdyssINT/"
	zotero_url="https://www.zotero.org/download/connector/dl?browser=firefox"

	# Obtener los números de ID de la URL y el nombre de cada extensión
	ids=($(curl -s "$url" | grep -o 'ID="[0-9]*"' | sed 's/ID=//' | tr -d '"'))
	names=($(curl -s "$url" | grep -o 'NAME="[^"]*"' | sed 's/NAME="//' | sed 's/"$//' | sed 's/ /_/g')) # Reemplaza espacios por guiones bajos

	# Mostrar los nombres de las extensiones y solicitar confirmación
	echo -e ${byellow}"Se van a instalar las siguientes extensiones:"${end}
	for name in "${names[@]}"; do
		echo -e ${blue}"- ${name//_/ }"${end} # Reemplaza guiones bajos por espacios
	done
	echo -e ${blue}"- Zotero"${end}
	echo -e ${red}"IMPORTANTE: A continuación se abrirá una pestaña de Firefox por cada extensión."${end}
	echo -e ${red}"            Acepta la instalación en cada pestaña incluyendo su uso en ventanas privadas."${end}
	read -p "$(echo -e ${byellow}"¿Desea continuar con la instalación? (S/n):"${end}) " confirmacion
	if [[ $confirmacion != "S" && $confirmacion != "s" ]]; then
		mostrar_banner
		echo -e ${byellow}"Volviendo al menú..."${end}
		listar_configurar_odyssint
		return
	fi

	# Deshabilitar las advertencias de GTK
	export GTK_MODULES=

	# Crear o vaciar el directorio para almacenar las extensiones descargadas
	extensions_dir="$odyssinthome/extensions"
	mkdir -p "$extensions_dir"
	rm -rf "$extensions_dir"/* # Borrar contenido si existe

	# Descargar e instalar las extensiones para cada ID
	for i in "${!ids[@]}"; do
		id="${ids[$i]}"
		name="${names[$i]}"
		echo -e ${bpurple}"Descargando extensión $name..."${end}
		# Descargar el archivo .xpi
		download_url="https://addons.mozilla.org/firefox/downloads/file/$id/addon-$id-latest.xpi"
		curl -s -o "$extensions_dir/$name-addon-$id-latest.xpi" "$download_url" 2>&1 | log
	done
	echo -e ${bpurple}"Descargando extensión Zotero..."${end}
	wget "https://www.zotero.org/download/connector/dl?browser=firefox" -O $extensions_dir/zotero_connector.xpi 2>&1 | log
	# Instalar todas las extensiones desde el directorio de extensiones
	echo -e ${bpurple}"Instalando todas las extensiones..."${end}
	firefox "$extensions_dir"/*.xpi 2>&1 | log

	# Preguntar si desea eliminar los archivos descargados
	read -p "$(echo -e ${byellow}"¿Desea eliminar los archivos descargados? (S/n):"${end}) " borrar_confirmacion
	if [[ $borrar_confirmacion == "S" || $borrar_confirmacion == "s" ]]; then
		rm -rf "$extensions_dir" 2>&1 | log
	fi
	mostrar_banner
	echo -e "${green}Instalación de extensiones completada."${end}
	listar_configurar_odyssint
}

# Función para instalar marcadores
function instalar_marcadores_firefox() {

	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ogreen}"                         Configurar OdyssINT > Marcadores                                   "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------------------"${end}
	echo -e "\n"

	# Verificar si Firefox está instalado
	if ! command -v firefox &>/dev/null; then
		echo -e ${red}"Firefox no está instalado. Por favor, ejecuta el primer paso del menú para instalarlo."${end}
		return
	fi

	# Solicita que tienes que tener instaladas las extensiones previamente
	echo "Para sincronizar los marcadores vamos a configurar la extensión 'BookmarkHub - sync bookmarks' en Firefox."
	echo -e ${red}"IMPORTANTE: Los marcadores existentes se borrarán para incluir los nuevos."${end}
	read -p "$(echo -e ${byellow}"¿Has ejecutado el paso de instalación de extensiones? (S/n):"${end}) " confirmacion
	if [[ $confirmacion != "S" && $confirmacion != "s" ]]; then
		mostrar_banner
		echo -e ${red}"Instala la extensión 'BookmarkHub ' de Firefox en el paso anterior para sincronizar los marcadores."${end}
		listar_configurar_odyssint
	fi
	echo -e
	echo -e "${cyan}Sigue los siguientes pasos para sincronizar los marcadores a través de esta extensión:"
	echo -e "1. Se abrirá la ventana de addons de firefox, abre la extensión 'BookmarkHub - sync bookmarks'."
	echo -e "2. Ve a la pestaña 'Preferences'."
	echo -e "3. En el campo 'Github Token', pega el valor '${end}${red}ghp_Veqj8j Zi2X4paEfLj ejtJgrdKNumyE32hu73${end}${cyan}' (Eliminando los espacios)."
	echo -e "4. En el campo 'Gist ID', pega el valor ${end}'${red}38a4f99ab9c2f2ab255bf122aa36f97f${cyan}'."
	echo -e "5. Selecciona ahora el icono de la extensión en la parte superior derecha del navegador,"
	echo -e "   el icono es un símbolo de un marcador de páginas blanco con un fondo gris."
	echo -e "6. Ejecuta ${end}${red}\"Download Bookmarks\"${end}${cyan} y espera a que la extensión"
	echo -e "   te confirme que ha podido sincronizar todos los marcadores a través de un pop-up."
	echo -e "7. Cierra el navegador."${end}

	# Deshabilitar las advertencias de GTK
	export GTK_MODULES=

	read -p "$(echo -e "${byellow}Se va a abrir la ventana plugins de firefox, sigue los pasos indicados y pulsa cualquier tecla para continuar"${end}) " confirmacion
	firefox -new-tab "about:addons"

	read -p "$(echo -e ${byellow}"¿Has configurado y sincronizado los marcadores? (S/n):"${end}) " confirmacion
	if [[ $confirmacion != "S" && $confirmacion != "s" ]]; then
		mostrar_banner
		echo -e ${byellow}"Vuelve a intentarlo..."${end}
		instalar_marcadores_firefox
	fi
	mostrar_banner
	echo -e "${green}Instalación de marcadores completada."${end}
	listar_configurar_odyssint

}

# Función eliminar herramientas instaladas y limpiar directorio de OdyssINT
function desinstalar_odyssint() {

	echo -e ${bred}"--------------------------------------------------------------------------------------------"${end}
	echo -e ${ored}"                         Configurar OdyssINT > Desinstalar OdyssINT                         "${end} | tee -a >(log) 2>&1
	echo -e ${bred}"--------------------------------------------------------------------------------------------"${end}
	echo -e "\n"

	echo -e ${byellow}"¿Eliminar las siguientes aplicaciones requeridas instaladas?  (S/n):"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e ${bred}"- $app"${end}
	done
	read -n 1 -r -s confirmacion
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		sudo apt-get purge $requerimientos 2>&1 | log
		echo -e ${bgreen}"Aplicaciones desinstaladas y carpeta de Odyssint eliminada..."${end} | tee -a >(log) 2>&1
	fi
	echo -e ${byellow}"¿Eliminar la carpeta $odyssinthome? (S/n):"${end}
	read -n 1 -r -s confirmacion
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		rm -rf $odyssinthome >>"$log"
		echo -e ${bpurple}"Carpeta eliminada..."${end}
	else
		mostrar_banner
		echo -e ${byellow}"Volviendo..."${end}
		listar_configurar_odyssint
	fi
	echo -e ${bpurple}"Saliendo del script..."${end}
	exit
}

# Inicio Script
trap ctrl_c INT
# Comprueba que el directorio de trabajo existe
comprobar_directorio
# Comprueba la versión del script
comprobar_version
# Muestra el menú principal
mostrar_banner
mostrar_menu_principal
