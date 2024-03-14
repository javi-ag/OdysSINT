# OdysSINT [![version-1.0](https://img.shields.io/badge/version-1.0-green)](https://github.com/javi-ag/OdysSINT/releases/tag/pre-release) [![CC0-1.0.1](https://img.shields.io/badge/license-cc0-blue)](https://github.com/javi-ag/OdysSINT/tree/main?tab=CC0-1.0-1-ov-file#) [![Shell](https://img.shields.io/badge/language-shell-red)](https://img.shields.io/badge/language-shell-red)
![1200px-WATERHOUSE_-_Ulises_y_las_Sirenas_(National_Gallery_of_Victoria,_Melbourne,_1891 _Óleo_sobre_lienzo,_100 6_x_202_cm)](https://github.com/javi-ag/OdysSINT/assets/153739397/b28f54ea-95cf-4b0f-a452-8afa41628b55)
_Ulises y las Sirenas, John William Waterhouse (National Gallery de Victoria, Melbourne)_


## :sailboat: ¿Qué es OdysSINT? 
OdysSINT es un script de instalación y uso de herramientas OSINT que tiene como objetivo ayudar en la ardua tarea de preparar un entorno adecuado para la realización de investigaciones. Su nombre proviene del juego de palabras Odyssey + OSINT,  esto es debido a la necesidad de reflejar, como en la epopeya de Homero, la dificultad de la exploración en las vastas aguas de información en fuentes abiertas hasta alcanzar nuestro objetivo como investigadores. La solución además dispone de un perfil de Firefox denominado Ulysses con todos los marcadores y extensiones y configuración especial que permite ser configurado también en Windows en unos pocos pasos.

## :white_check_mark: Caracteristicas OdysSINT  
- Completo listado de herramientas, extensiones y marcadores.
- Descripción intuitiva de cada elemento.
- Heramientas instalables compatibles con cualquier distribución con base Debian.
- Menú intiutivo de uso.
- Instalación componente a componente o de toda la solución.
- Instalación automática desatendida.
- Notificación de actualizaciones y posibilidad de actualizar desde el propio script.
- Marcadores y extensiones compatibles con cualquier sistema operativo que disponga de Firefox.

## :diving_mask: Herramientas OSINT  
* [theHarvester](https://github.com/laramies/theHarvester): obtiene emails, IPs y subdominios de diferentes fuentes online (CLI).
* [Recon-ng](https://github.com/lanmaster53/recon-ng): framework de automatización para tareas de OSINT. Permite ejecutar diferentes módulos para recopilar información de forma eficiente (CLI\Web).
* [Spiderfoot](https://github.com/lanmaster53/recon-ng): automatiza la recolección de información sobre activos en línea desde multiples fuentes, identificando riesgos e inteligencia (Web).
* [NExfil](https://github.com/thewhiteh4t/nexfil): encuentra nombres de usuarios en más de 300 webs en pocos segundos (CLI).
* [Photon](https://github.com/s0md3v/Photon): rastrea rápidamente webs y recopilar información como URLs, archivos y metadatos (CLI).
* [Geo-recon](https://github.com/radioactivetobi/geo-recon/tree/master):Geolocalización de IPs a través de diferentes bases de datos públicas (CLI).
* [Maltego](https://www.maltego.com/): extrae y analiza datos de múltiples fuentes mediante transformadas representándolos de forma visual y permitiendo encontrar relaciones y patrones (App).
* [ArchiveBox](https://github.com/ArchiveBox/ArchiveBox): archivado local de páginas webs para su visualización offline (Web\Add-on).
* [Zotero](https://www.zotero.org): gestor de referencias para la organización en las investigaciones (App\Add-on).

## :anchor:	Herramientas Complementarias  

* [Zenamp](https://nmap.org/zenmap): interfaz gráfica de Nmap, escanea redes y descubre vulnerabilidades (App).
* [Tor Browser](https://www.torproject.org): para navegar anonimamente con el perfil Ulysses por la red Tor (App).
* [OnionShare](https://onionshare.org): comparte archivos de forma segura y anónima mediante la red Tor (CLI).
* [KeePassXC](https://keepassxc.org): almacena datos y contraseñas de forma segura (APP).
* [Notepadqq](https://notepadqq.com): potente editor de texto parecido a Notepad++ (APP).
* [Dia](http://live.gnome.org/Dia): editor de diagramas ideal para generar relaciones en investigaciones.
* [VLC](http://www.videolan.org): visualizador y conversor de videos.
* [Audacity](https://www.audacityteam.org): escucha y edita audios.
* [Flameshot](https://flameshot.org): realiza capturas de pantalla y las edita de forma simple.

## :globe_with_meridians: Marcadores 
- **ANÁLISIS DOMINIO / URL:** Dominios Raíz IANA 
## :jigsaw: Extensiones
 
## :package: Instalación 
OdysSINT tiene varias opciones de instalación que se pueden ajustar a diferentes necesidades:

- **OVA preconfigurada**: contiene todas las herramientas OSINT, herramientas complementarias, y el perfil Ulysses para Firefox y Tor con las extensiones y marcadores. Para quien no quiere complicarse, en pocos minutos de descarga se improrta en Virtual Box o en VMWare Player y a disfrutar!!!
 
- **Script configurable**: instala todos las herramientas OSINT, herramientas complementarias y el perfil Ulisses de forma conjunta o elemento a elemento, compatible con cualquier distribución basada en Debian (probado en Debian 12 y Ubuntu 22.04.03), la mejor opción si disponemos de un un sistema basado en Debian y no queremos realizar una descarga de gran tamaño. Al descargarlo hay que asegurarse de que el script tiene permisos de ejecución:
  ```bash
  git clone https://github.com/javi-ag/OdysSINT.git
  cd OdysSINT
  chmod +x OdysSINT.sh
  ./OdysSINT.sh
  ```
  GIF 
- **Perfil Ulysses para Windows**: contiene los marcadores, extensiones y configuración personalizada del proyecto y puede ser configurado siempre que se disponga de una versión de Firefox reciente. Para quien no quiere probar otro sistema operativo. Seguiremos los siguientes pasos:
  - Descargamos el fichero Ulysses_Windows.zip
  - En el explorador de archivos pegaremos en la barra de direcciones %APPDATA%/Mozilla/Firefox/ y copiaremos ahí el fichero anterior, extrayendo su contenido y sobrescribiendo su contenido.
    
> [!CAUTION]
> Este último paso elimina el acceso al perfil existente de Firefox, por lo que si lo quieres recuperar en un futuro cambia el nombre a los ficheros existentes y devuelvelos a su estado anterior para su recuperación.

INCLUIR GIF


## :gear: Configuración

## :arrow_down: Descargas 
### OVA:
  Enlace a repositorio: https://URL.com
  **Decryption key**: pfsMdmfPZIn9NQQreDsNaA
  **SHA256sum**: 60BFD883FDDE934994B58A8B03B2169C922921056767CF3D1012A0603EA026D3
  **Formato**: Ova (VirtualBox)
  **Credenciales**: Usuario: **ulysses** Contraseña: **ulysses**
### Script:
Desde el propio repositorio

## :computer: Uso 	

## :open_book: FAQ

## Contacto :incoming_envelope:	
Para cualquier sugeriencia o duda:
odyssint@protonmail.com

PONER CAPTURAS Y USO DE AYUDA

> [!IMPORTANT]
> Recomiendo la personalización inmediata de la contraseña por una robusta siguiendo las siguientes sugerencias:
>    - No almacenar las contraseñas en texto plano.
>    - Una longitud de entre 6 y 10 caracteres.
>    - Que contenga al menos un carácter en mayúsculas y un carácter numérico.
>    - No emplear nombres o fechas personales o de familiares
>    - No emplear contraseñas comunes como 123456 o asdfghjk
>    - Cambiar la contraseña cada 3 meses.
   
> [!WARNING]
> Recuerda que todas las actividades enmarcadas en el proceso de investigación deben estar dentro del marco legal y jurudico vigente en la localidad donde estes. Es muy importante que
> conozcas bien este marco juridico para que no incurras en un delito informatico sin saberlo.


> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.


