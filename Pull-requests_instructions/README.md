# ¿Qué es una *pull request*?
![portada](https://github.com/Fominayasg/Instrucciones_pull-request/blob/main/images/look-pull-requests.jpeg)

Una pull request es una petición de validación de cambios que se hace a un repositorio.

Es la manera en la que se muestra una sugerencia de cambio sobre el código del repositorio original.

En vuestro caso, la **pull request** va a ser el método de entrega para todos los labs durante este bootcamp.

## 🧠¿Pero cómo hacemos una *pull request*?🧠

Cada día tendréis disponible un nuevo repositorio en la organización de GitHub de [Ironhack](https://github.com/Ironhack-Data-Madrid-Enero-2022) con el lab correspondiente al material dado durante las clases.

También podéis encontrar el link al lab directamente en el [Student Portal](https://my.ironhack.com/).

### Los pasos a seguir son los siguientes:

**1.** **Forkear**  :fork_and_knife: el repo del lab desde el GitHub de [Ironhack](https://github.com/Ironhack-Data-Madrid-Enero-2022) (aparecerá un repo con el mismo nombre en tu cuenta de GitHub)
![img_pull1](https://github.com/Fominayasg/Instrucciones_pull-request/blob/main/images/img_1.jpg)

**2**. Copiar el link del nuevo repo de **MI GitHub**.

1. Pulsar el botón verde **CODE**
2. Copiar el link (asegúrate que en el link aparece tu usuario de github)
![img_pull2](https://github.com/Fominayasg/Instrucciones_pull-request/blob/main/images/img_2.jpg)

**3**. Ir a la **terminal** y navegar hasta la carpeta donde yo quiera tener mi lab.
Una vez en la carpeta adecuada, escribo el siguiente comando: **`git clone www.el-link-a-mi-repo.com`**. Ya tenemos el lab en nuestro ordenador!!! Bien!!

**4**. Hacer un **cambio** en algun archivo. Si NO lo hacemos, como nuestro código es exacto al del repositorio original, no podremos hacer la pull request.

**5**. Volver a la terminal y asegurándonos de estar en la carpeta principal del repositorio en el que estamos trabajando, ejecutamos los siguientes comandos uno por uno.

    
1. **`git status`** (veremos los archivos cambiados)
2. **`git add nombre_archivo_cambiado`**
3. **`git commit -m "mensaje"`** (sustituye "mensaje" por la descripción del cambio que se vaya a commitear)
4. **`git push origin main`** (sustituye "main" por "master" si tu rama principal se llama así)
___
    Ya tenemos subidos nuestros cambios a nuestro repositorio de GitHub.
___
**6.** Hacer la **PULL REQUEST**. Para ello iremos a nuestro repositorio forkeado de GitHub y haremos "click" en la pestaña `Pull requests`, y después en `New pull request`.
![img_pull3](https://github.com/Fominayasg/Instrucciones_pull-request/blob/main/images/img_3.jpg).

**7.** Hacer click en `Create pull request`.

![img_pull4](https://github.com/Fominayasg/Instrucciones_pull-request/blob/main/images/img_4.jpg)

Se nos abrirá un formulario en el que se nos pedirá que introduzcamos el título y mensaje de la pull request.

**8.** Escribimos en el título lo siguiente:
    `[Nombre-del-lab] Nombre Apellido`

**9.** Rellenamos el comentario de la pull request siguiendo la siguiente plantilla:

---
- **Nivel de dificultad:** [1-5] *(1 muy fácil, 5 muy difícil)*
- **Último ejercicio terminado**: *Aquí pondremos cuál es el último ejercicio que hemos completado y si nos hemos dejado alguno anterior sin contestar*
- **Dudas**: *Aquí podemos escribir si tenemos alguna duda concreta que no hemos podido resolver*

---

## 🧠¿Y ahora cómo continuo?🧠

Una vez hecha la *pull resquest* puedes continuar resolviendo el lab. 

Cada poco tiempo (cuando resuelvas un ejercicio complicado o lleves 3 o 4 ejercicios) acuérdate de repetir el paso 5 para que tus cambios se vayan subiendo a GitHub.

Puedes repetir el paso 5 tantas veces como quieras, y tus cambios quedarán actualizados en GitHub. De esta manera cuando revisemos tu pull request, podremos ver la última versión de tu lab.

Y ahora... ¡¡A trabajar Ironhacker!! :rocket: :rocket: :rocket: :rocket: