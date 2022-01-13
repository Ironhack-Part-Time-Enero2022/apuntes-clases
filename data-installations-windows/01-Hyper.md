# 1. Install Hyper in Windows

1) Activar la feature de Windows, deshabilitada por defecto, que permite instalar el subsistema de Linux. Para ello, ejecutamos Powershell como Administrador e introducimos el siguiente código:


    ```
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    ```

2) Cuando nos pida reiniciar, lo hacemos (pulsando Y + Enter)

3) El siguiente paso es instalar el subsistema de Linux para Windows. Se pueden elegir muchas distribuciones, pero lo normal es escoger Ubuntu (la versión más estable en el momento de realizar la instalación). La descarga [aquí](https://www.microsoft.com/store/p/ubuntu/9nblggh4msv6)

4) Cuando ya tengamos el subsistema descargado, lo instalamos y lo iniciamos una primera (y única) vez. No tendremos que usar esa consola más adelante, pero es necesario que la abramos una primera vez antes de seguir adelante.

5) Nos pedirá que creemos un usuario y contraseña para Linux. Lo hacemos.

6) Instalamos Hyper, que será el software que utilizaremos para acceder a la command line:
https://hyper.is/

7) Abrimos Hyper y pulsamos Ctrl + , para acceder al archivo de configuración, donde vamos a realizar dos cambios. 
    - El primero y más importante, rellenar el campo “shell” con la siguiente ruta:


            shell: 'C:\\Windows\\System32\\bash.exe',



    - La segunda, cambiar el theme para que luzca más bonito. Lo hacemos rellenando el campo “plugins” de este archivo de configuración.

                    
            plugins: [
            //"hyper-dracula"
            //"hyper-solarized-dark"
            "hyper-material-theme"
            ],
        Para más "plugins" [aquí](https://github.com/bnb/awesome-hyper)

🔴 A partir de aquí los pasos no son obligatorios, pero recomendados

8) Hacemos un apt-get update.

9) Nos vamos a la ruta raíz escribiendo “cd” (sin comillas). IMPORTANTE IR A LA RAÍZ (hacemos cd)

10) Escribimos `nano .bashrc` y se nos abre un archivo en la consola (NOTA: tiene que ser con nano o vim, no vale un editor externo)

11) Pegamos este código al principio del archivo Y GUARDAMOS. Nos aseguramos de que se ha guardado.

        bash -c zsh
        case $- in

12) Con esto, si reiniciamos Hyper ya debería abrirse con ZSH iniciado. Lo sabremos porque habrá cambiado el aspecto, pero también podemos crear una carpeta y hacer git init para comprobar que sale el indicador del master.  

OPCIONAL - Podemos instalar también Oh My ZSH y cambiar el theme en el archivo .zshrc
(desde raíz y abriendo con un editor de consola, nunca externo)

Con este comando lo instalamos: 

    sh -c "$(curl -fsSL
    https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/maste
    r/tools/install.sh )"


Y esto es lo que meteríamos en el .zshrc para cambiar el theme: 

ZSH_THEME="agnoster"
