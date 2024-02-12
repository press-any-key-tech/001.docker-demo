# 001.docker-demo
Demo de docker para el canal Press Any Key

<!-- TOC -->

## Presentación

Si te dedicas a la informática, especialmente al mundo del desarrollo de software, o si te interesa este campo, es probable que hayas oído hablar de contenedores y, seguramente, de Docker.

Hoy te explicaré qué son los contenedores y para qué se utilizan, cómo funciona Docker y cómo puedes empezar a utilizarlo desde ya.

En una tarde, podrás convertirte en aprendiz de ninja.

Soy Lino

y esto es Press Any Key.

## Intro

Antes de que los containers se pusieran de moda, la manera más común de distribuir aplicaciones era mediante paquetes o instaladores.

Se distribuía un archivo que, una vez ejecutado, instalaba la aplicación en el sistema operativo del usuario.

O se ejecutaba un procedimiento manual para instalar el software en un determinado ordenador.

Esto se sigue haciendo hoy en día con aplicaciones de escritorio y móviles, por supuesto. Los containers son una alternativa para distribuir aplicaciones, no un sustituto.

El mayor problema de distribuir las aplicaciones mediante instaladores es que, a menudo, esos programas dependen de ciertas librerías o componentes del sistema operativo; si no son las versiones correctas se suelen producir errores graves.

Además, no sería la primera vez que sucede que al instalar una determinada aplicación se actualizan o sobreescriben ciertos componentes que otra aplicación necesita y se provoca un jaleo de errores … interesante.

Si eres un usuario normal y falla el Office o el Photoshop, puede ser una molestia. Quizás necesites reinstalar algo, pero no causará demasiados problemas.

Sin embargo, si eres responsable de un gran sistema informático que ejecuta aplicaciones críticas, donde se mueven millones de euros por minuto, el hecho de que un programa falle y deje parado el sistema puede provocar muchos dolores de cabeza y pérdidas de dinero significativas.

Una solución a estos problemas podría ser el uso de máquinas virtuales para ejecutar estas aplicaciones. Sin embargo, una máquina virtual requiere la instalación y configuración de un sistema operativo completo, además de la necesidad de mantenerlo actualizado.

Aunque estás limitando el daño al aislar los programas en su propia máquina virtual, también estás desperdiciando recursos informáticos.

¿No sería mucho mejor que esas aplicaciones y sus librerías se ejecutasen aisladas y sin interferencias entre ellas, y que además se puedieran ejecutar varias a la vez en un mismo ordenador y se aprovechasen todos sus recursos de memoria, CPU y disco?

Pues eso son los contenedores:

Son paquetes de software que contienen uno o varios programas y todas las librerías que necesitan.

Y cuando se ejecutan en un mismo ordenador lo hacen aislados unos de otros.

No es necesario tener un sistema operativo completo ejecutándose en cada contenedor, como ocurre en el caso de una máquina virtual.

Tampoco se están ejecutando servicios innecesarios, como el indexador de ficheros de Windows o un servicio de impresión.

De esta manera, no se están desperdiciando recursos en acciones que son inútiles.

Para ejecutar contenedores, solo hace falta lo que se llama un container runtime, o motor de contenedores, ejecutándose sobre un ordenador.

Y a este ordenador se le llama HOST.

Un container runtime no es más que un programa que usa la API del sistema operativo para aislar procesos entre sí, y para asignar cuántos recursos computacionales (como memoria, o CPU) puede tener asignados cada proceso.

Todo este sistema lo provee el kernel, o núcleo de Linux.

- Mediante los llamados “namespaces” (o espacios de nombre) se aislan los procesos entre sí.
- Y usando cgroups (o control groups), se asignan recursos a esos procesos.

Así que los containers son algo nativo y exclusivo de Linux.

Pero quizás me digas: oye, pero yo puedo ejecutar contenedores en Windows y Mac con un programa llamado Docker Desktop (por ejemplo).

Claro, porque Docker Desktop está ejecutando una máquina virtual de Linux para poder lanzar contenedores.

En Windows está usando, probablemente, el sistema WSL2, que es el Subsistema de Linux sobre windows, o sea, una máquina virtual.

En Mac es muy probable que esté usando una ligera máquina virtual llamada Linuxkit VM.

[https://www.docker.com/blog/the-magic-behind-the-scenes-of-docker-desktop/](https://www.docker.com/blog/the-magic-behind-the-scenes-of-docker-desktop/)

Quiere esto decir que usar containers en Windows y Mac es tirar recursos a la basura?

Sí

pero la comodidad que te da para desarrollar o probar programas en tu ordenador bien vale perder un pequeño porcentaje de uso de CPU.

Cuando hablamos de contenedores siempre se menciona Docker, y de hecho, para la gran mayoría de personas de este mundillo, docker son contenedores, no hay nada más.

Pero eso no es cierto, existen más sistemas de contenerización, por ejemplo:

- LxC o Linux Containers.
- rkt o Rocket
- O incluso OpenVZ.

Claro que Docker fue el sistema que nos facilitó el uso de containers y ayudó muchísimo a popularizarlo.

Así que, gracias, ballenita

(por cierto, la ballena mascota de docker se llama Moby Dock)

[https://www.docker.com/blog/call-me-moby-dock/](https://www.docker.com/blog/call-me-moby-dock/)

## Instalación

Hasta aquí la teoría y la historia, ahora te voy a enseñar a usar Docker.

El primer paso es instalarlo y para ello tienes que seguir las instrucciones adecuadas para tu sistema operativo.

En Linux se suele instalar la docker engine que te proporciona todas las herramientas de docker en línea de comandos. No hay ventanitas.

[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

En Mac, con Docker Desktop te lo da todo hecho, es instalar y listo.

[https://docs.docker.com/desktop/install/mac-install/](https://docs.docker.com/desktop/install/mac-install/)

Y con Windows también tienes la opción de Docker Desktop, aunque requiere tener instalado WSL2. Son algunos pasos más, pero es poca cosa.

[https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/)

Claro que si te sientes muy hacker, puedes instalar Docker engine sobre WSL2. Pierdes la ventanita de docker desktop pero ganas en estabilidad.

Docker contiene un container runtime, para ejecutar contenedores, y te provee de unas herramientas de línea de comandos para manejarlos.

Docker Desktop te da lo mismo y además te da una ventanita gráfica donde puedes visualizar y administrar tus contenedores.

Esto son manías personales mías, pero yo prefiero usar una terminal de texto para manejar docker, entre otras cosas porque es más versátil y más rápido, no tienes que ir haciendo click click en ventanitas.

Además, en los sistemas en producción, que suelen estar en linux, no hay ventanitas. O te sabes los comandos o nada.

## Ejecutar el primer contenedor

Bien, aquí tengo en mi ordenador docker Desktop instalado. Es un Mac, no he tenido muchas más opciones.

Lo primero que voy a hacer es lanzar una ventana de terminal.

En Linux, harías lo mismo, lanzar una ventana de terminal, y en Windows puedes usar Powershell o la línea de comandos clásica, cmd.

El primer comando que te voy a mostrar es el que sirve para ejecutar contenedores. Se llama “docker run”.

Y el primer contenedor que voy a ejecutar va a ser un servidor web con una página web muy simple, y para ello tecleo esto que ves en pantalla.

```bash
docker run --name mynginx -p 80:80 -d nginx
```

Como puedes ver, lo primero que hace es buscar si tiene la imagen del contenedor en el disco duro local del ordenador host, es decir, mi ordenador; si no lo tiene, se lo descarga.

En un ratito te indico desde dónde se descargan las imágenes de contenedores.

Después arranca el contenedor y la única respuesta es una larga cadena de caracteres, que es el identificador de mi contenedor.

Todos los contenedores tienen un identificador único que es una cadena de caracteres. Normalmente docker no te va a mostrar toda la cadena sino solo una parte, que es mucho más manejable y más sencilla de visualizar en pantalla.

Ahora que tengo un contenedor en ejecución, si abro un navegador y tecleo [http://localhost](http://localhost) me muestra, la página web de un servidor web NGinx en ejecución. Un servidor muy básico, claro.

Estoy dando por supuesto que conoces que [localhost](http://localhost) es el nombre de tu propio ordenador y que además sabes que su dirección ip es 127.0.0.1

Si no lo sabes, o si necesitas refrescar tus conocimientos de redes y te interesa que cree un video sobre ello, avísame en los comentarios y veré qué puedo hacer para ayudarte.

## Listar contenedores

Si tienes Docker Desktop y vas a la pestaña de contenedores verás que ha aparecido un nuevo contenedor en ejecución.

Las personas normales, pero a la vez eficientes, usamos un comando de docker para saber si tenemos contenedores en ejecución, y este comando se llama “docker ps”:

```bash
docker ps
```

La línea de información que muestra docker ps contiene:

- el identificador o id del contenedor, que como puedes ver coincide en gran parte con el ID que nos devolvió al ejecutar docker run.
- La imagen en la que se basa ese contenedor, que ahora te explico qué es.
- cuánto tiempo lleva ejecutándose.
- Su estado (en ejecución, parado, con error, etc.)
- El mapeo de puertos entre el contenedor y el ordenador host
- Y Su nombre, porque todos los contenedores tienen nombre.

Los contenedor se pueden arrancar y parar todas las veces que quieras. Y no solo eso, una vez que los has arrancado por primera vez mantienen esa configuración… hasta que los borras.

## Docker run

Voy a pararme un momento para examinar el comando “docker run” porque es importante que aprendas cómo se configura un contenedor, ya que eso cambia su comportamiento completamente.

```bash
docker run --name mynginx -p 80:80 -d nginx
```

El primer parámetro que he especificado es un nombre, que ha de ser único para la máquina host en la que se ejecuta. Si no hubiera especificado ese parámetro name, docker me habría generado uno de forma automática.

Ese nombre del contenedor es muy importante por dos razones:

- La primera es que es la forma en la que nos vamos a dirigir a ese contenedor para realizar operaciones como arrancarlo, pararlo, examinar logs, o incluso acceder a él mientras está arrancado para modificarlo. Si no tenemos ese nombre hemos de usar el identificador del mismo, que no es ni cómodo ni sencillo de recordar.
- La segunda razón es que este nombre será el nombre que podrás usar para que otros contenedores puedan comunicarse con él.

Porque docker crea una red interna y asigna a cada contenedor una dirección IP y un nombre.

## Red interna

¿Qué utilidad tiene esta red interna?

Básicamente permite que los contenedores se comuniquen entre sí sin exponerse al exterior, a menos que sea necesario. Por ejemplo, puedes tener una base de datos ejecutándose que no está expuesta al exterior pero sí da servicio a otro contenedor.

Es más, puedes crear tus propias redes dentro de docker, pero eso es un tema un poco más avanzado que no es necesario que conozca un aprendiz de ninja ;-)

El segundo parámetro, -p, se usa para exponer puertos de contenedores en la máquina host. El primer número antes de los dos puntos es el puerto del host donde quieres exponer el servicio (80, en este caso), y el segundo número es el puerto del contenedor a exponer.

El mapeo de puertos te permite tener ejecutándose varios contenedores idénticos, pero mapeados a distintos puertos.

Podría usar un Balanceador de Carga en el host para ir alternando entre contenedores según fuesen llegando peticiones, por ejemplo; y de esta forma no sobrecargaría a un solo contenedor y aprovecharía todos los recursos del ordenador.

Y esa operación de balanceo de carga es la forma en la que kubernetes trabaja, por ejemplo.

Ojo! que también podría lanzar un contenedor que se encargase de balancear los contenedores en la red interna. Hay muchas posibilidades.

Vuelvo a los parámetros, y el siguiente en la lista es -d que indica que el contenedor se lanzará en modo desconectado, se convertirá en algo así como una especie de servicio.

Por defecto cuando lanzas un contenedor la línea de comandos se queda conectada al mismo y vas a ver los mensajes que emite ese contenedor y si paras el proceso (usando CTRL + C) por ejemplo, se para el contenedor.

Esto, la mayor parte de las veces no es conveniente, ya que el objetivo de los contenedores es lanzar programas y que se queden ejecutándose, no quieres que se paren en cuanto sales del temrinal o cuando desconectas una sesión remota.

Pues para eso se usa “-d”.

Y el último parámetro del comando run es el nombre, también llamado repositorio, y la etiqueta o tag de la imagen del contenedor que voy a lanzar.

Si no se especifica la tag de una imagen, docker intentará bajarse por defecto una imagen con la etiqueta latest.

## ¿Qué es una imagen?

¿Y qué demonios es una imagen?

Pues es un fichero que contiene las librerías y programas que son necesarios para ejecutar un container y, lo más importante, contiene las opciones de configuración que le indica a docker cómo puede ejecutar ese contenedor.

Esto quiere decir que un contenedor no es más que una imagen configurada para ser ejecutada. La imagen sabe qué puertos pueden ser expuestos al exterior, qué variables de configuración se pueden usar y cómo ha de ser lanzada. Un contenedor asigna valores a esos parámetros, les da un nombre, una dirección IP y la ejecuta.

Vamos, una imagen es la plantilla de un contenedor.

## Registry Servers

Y ahora viene lo mejor de docker,

que es que no es necesario que construyas tú las imágenes, sino que también existen imágenes disponibles pública (o privadamente si tienes acceso) en lo que se llaman Registry Servers o Registry Services.

Yo he usado una imagen del servidor web nginx, y esa imagen no la tenía en mi ordenador host, sino que docker se ha conectado a un registry service, se ha bajado la imagen, la ha configurado y la ha ejecutado. Los muy amables señores de nginx tenían construida una imagen para que yo pudiera usarla

Por defecto docker va a buscar las imágenes públicas en un un registry service que se llama Docker Hub.

Ahí, la mayor parte de proyectos open source, e incluso proyectos privados de empresas, publican sus imágenes para que podamos usarlas los mortales.

[https://hub.docker.com/](https://hub.docker.com/)

Docker Hub dispone de un buscador de imágenes y todas las imágenes están bastante bien documentadas para que puedas usarlas rápidamente.

Mira por ejemplo la documentación de nginx, que te indica cómo lanzarlo y configurarlo para adaptarlo a tu gusto.

Por supuesto existen registry services privados, casi todos los proveedore Cloud tienen un servicio de este tipo, por ejemplo Amazon tiene ECR, Azure tiene ACR y Google tiene Container Registry.

También, si te interesa, puedes tener tu propio registry server privado.

Ya que estoy en docker hub voy a ver si disponen de una imagen de mysql …

Estoy haciendo trampa, ya sé que existe, pero quiero enseñarte cómo funciona el buscador, que es esa casilla de texto que está arriba del todo de la página.

Simplemente tecleas la imagen que quieres buscar y te dará datos de todas las imágenes de las que disponga.

Entre los primeros resultados tenemos la imagen oficial de mysql, la imagen de MaríaDB y algunas otras imágenes ofrecidas por ciertas organizaciones, como Percona o Bitnami.

Abro un pequeño paréntesis aquí: muchas veces las mejores imágenes no provienen de la empresa u organización que ha creado el producto; hay empresas como las que te he mencionado que han mejorado productos open source y sus imágenes, en muchos casos, son más estables que las “oficiales”.

Te pongo un ejemplo, es mucho más sencillo montar un cluster de Redis usando las imágenes de Bitnami que si tienes que hacerlo usando las imágenes oficiales que te ofrece Redis.

Pero cuáles son las mejores imágenes o cuáles se adaptan mejor al proyecto que estás creando ya lo irás aprendiendo con el tiempo.

Al hacer click sobre la imagen oficial de Mysql te lleva a su página de documentación donde te suele indicar, las versiones del servidor que ofrecen, lo que llaman “tags”, te muestran los comandos para lanzar la imagen con ciertas configuraciones, y suelen indicar todos, o la gran mayoría, de los parámetros que admite la imagen.

## Docker run mysql y nginx

Voy a probar a lanzar en mi ordenador la versión 8 de MySQL, así que me copio esta línea de comandos del manual y la modifico un poco:

```bash
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

Para empezar le voy a llamar mysql8, y no some-mysql

La password de root va a ser “secreta”, ahí con toda la seguridad.

Además voy a abrir el contenedor al exterior, para poder acceder con un explorador de bases de datos. El puerto por defecto de mysql es el 3306.

y por último, voy a especificar, en lo que se llama “tag”, que quiero la versión 8.

La línea se quedaría como te muestro en pantalla:

```bash
docker run --name mysql8 -e MYSQL_ROOT_PASSWORD=secreta -p 3306:3306 -d mysql:8
```

En cuanto lanzo el comando docker run se descargará desde docker hub la imagen de mysql 8 y la ejecutará.

Si uso docker ps puedo ver que ahora tengo dos contenedores en ejecución:

- mysql8
- y nginx.

Para comprobar que se está ejecutando Mysql voy a usar DBeaver, que es un explorador de bases de datos.

Configuro una nueva conexión, de tipo Mysql,

y en ella establezco el servidor, que estará en localhost, es decir, en mi ordenador,

el usuario será root,

y la password “secreta”

Yo suelo usar el botón de Test Connection o Probar Conexión para comprobar que todo va bien.

Si es la primera vez que creas una conexión de tipo Mysql, Dbeaver te va a solicitar instalar el driver para conectar con la base de datos.

y puedes ver que ha funcionado, así que pulso Finalizar y se me abre el explorador de bases de datos.

Ahí puedo ver mi nueva base de datos mysql, que está relativamente vacía.

Y ya que he llegado hasta aquí, te voy a demostrar una de las grandes ventajas de los contenedores.

Tengo un contenedor con nginx, otro con mysql versión 8, y ahora, voy a ejecutar un contenedor con la versión 5 de mysql.

Si intentas hacer lo mismo que yo, instalar y poner a funcionar dos versiones distintas de mysql en un solo ordenador, no diré que no sea posible, pero lo vas a pasar muy, pero que muy mal, para que todo funcione como es debido.

Y lo que sucede con mysql, pasa con cualquier otra aplicación. Es un infierno poder mantener en el mismo ordenador dos o más versiones del mismo programa.

Con docker es tan sencillo como modificar la versión, el nombre, y asignar un nuevo puerto de salida.

Hay un ligero problema con los ordenadores Mac que tienen procesadores M1 o M2, es decir, que usan un procesador de tipo ARM, y es que en Docker Hub, no existe ninguna imagen compatible con estos procesadores para mysql 5.

Lo que he de hacer, en mi caso, es agregar un parámetro extra para indicar que se baje una imagen preparada para Linux y que la “virtualice” en mi ordenador.

Eso se hace mediante la opción platform.

En el comando que usé para lanzar mysql8 simplemente lo cambio un poco.

```bash
docker run --name mysql5 --platform linux/amd64 -e MYSQL_ROOT_PASSWORD=secreta -p 3307:3306 -d mysql:5
```

Y al ejecutarlo, y lanzar después docker ps, se pueden ver tres containers en ejecución.

Por supuesto puedo conectar a mi nueva base de datos usando DBeaver configurando una nueva conexión:

El único cambio apreciable es que el puerto que voy a usar es el 3307.

Et voilá!!! Aquí está mi nuevo servidor mysql5.

En este pequeño ordenador tengo 2 bases de datos y un servidor web ejecutándose, y lo he hecho sin demasiado esfuerzo.

Ahora ve y haz lo mismo sin contenedores.

## Docker inspect

Sigo.

Cuando un contenedor está configurado en docker puedes obtener información sobre él usando el comando docker inspect:

```bash
docker inspect mynginx
```

Este comando te va a mostrar todos los datos relativos al contenedor en formato JSON.

No me voy a parar demasiado pero sí que me gustaría que te fijases que, en la parte de Network, está la dirección IP única asignada al contenedor dentro de la red local de Docker.

## Docker logs

Otro comando muy interesante es el que permite ver los mensajes emitidos por un contenedor, lo que vienen a ser LOGS.

Simplemente tecleo docker logs y el nombre o el identificador del contenedor y ahí están los mensajes que el contenedor pinta en la salida estándar.

```bash
docker logs mynginx
```

Este comando muestra todos los mensjaes emitidos por el contenedor desde el primer momento que se arrancó, lo que no es muy cómodo.

Existe un modificador llamado -f (o follow), que conecta la terminal con el contenedor y actualiza los mensajes según se van produciendo.

Fíjate qué sucede si lo ejecuto, que se queda esperando.

```bash
docker logs -f mynginx
```

Si ahora voy a mi navegador web y refresco la página se va a mostrar en los logs que se ha producido un nuevo evento.

```bash
172.17.0.1 - - [18/Feb/2023:15:16:25 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36" "-"
2023/02/18 15:16:25 [error] 22#22: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 172.17.0.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost", referrer: "http://localhost/"
172.17.0.1 - - [18/Feb/2023:15:16:25 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36" "-"
2023/02/18 15:09:26 [notice] 1#1: start worker process 25
172.17.0.1 - - [18/Feb/2023:15:16:25 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36" "-"
```

Para salir del comando logs se usa la combinación de teclas CTRL + C.

## Docker stop

Si quieres parar un contenedor usas el comando docker stop y le indicas o bien el nombre del contenedor o bien su identificador.

En mi caso, voy a parar los dos servidores de mysql, porque no están haciendo nada útil.

```bash
docker stop mysql5
docker stop mysql8
```

Si todo ha ido bien me responderá con el nombre del contenedor.

Si refresco las conexiones en DBeaver obtendré un error, ya que los servidores no están disponibles.

Ahora voy a parar nginx

```bash
docker stop nginx
```

Y si ahora refresco la página localhost en mi navegador web puedo comprobar que ya no tengo ningún servidor web ejecutándose.

Cuando un contenedor se para ya no se muestra en la lista de contenedores en ejecución, así que sí uso docker ps, no obtendré nada.

```bash
docker ps
```

Pero el contenedor no se ha borrado, solo está parado.

Puedo añadir un modificador a docker ps para que me muestra todos los contenedores independientemente de su estado de ejecución. El modificador es -a

```bash
docker ps -a
```

Si te fijas, el estado indica que la ejecución ha terminado, y ya no hay ningún puerto abierto hacia la máquina host.

## Docker start

Si quiero volver a lanzar un contenedor parado tengo que usar el comando start, indicando el nombre o el identificador del contenedor.

```bash
docker start mynginx
```

Y si vuelvo al navegador y refresco, puedes ver que ha vuelto el servidor web.

La gran ventaja de los contenedores es que los puedes parar y arrancar a petición y además, una vez que los configuras por primera vez, mantienen esa configuración y se conservan todos los datos que hayan podido ser modificados dentro de él durante su ejecución.

## Docker exec

Te lo voy a mostrar y así aprovecho para enseñarte también cómo puedes acceder a un contenedor que está en ejecución.

Ya que tengo el servidor nginx ejecutándose voy a acceder a él y modificar la página de inicio, por ejemplo.

Para conectarme al contenedor voy a usar el comando exec, que permite ejecutar un comando dentro de un contenedor.

En mi caso me interesa lanzar la shell de bash, el intérprete de comandos de linux, así que el comando será:

```bash
docker exec -it mynginx /bin/bash
```

La sintaxis de este comando es muy sencilla:

- tras exec se ha de indicar el parámetro -it que indica que quiero entrar en modo interactivo, es decir que voy a poder ver los mensajes emitidos por ese contenedor y que podré enviar comandos desde mi teclado. En resumen, que nos vamos a “conectar” con ese contenedor de forma interactiva.
- Después se indica el nombre o el ID del contenedor.
- Y por último se indica el comando a ejecutar en ese contenedor.

Una pequeña observación,

yo sé que este contenedor incluye la shell bash porque he ido a leer su documentación de docker hub y he averiguado cómo ha sido construido. Podría darse el caso de que no incluyan esta shell e incluyan alguna otra como sh, que es la más básica, o zsh o incluso powewrshell, ¿por qué no?

También podría darse el caso de que no quisiera ejecutar una shell interactiva sino cualquier otro comando. El último parámetro de docker exec nos da la flexibilidad de ejecutar cualquier comando.

Al lanzar este comando ves que he accedido a auna shell donde indica que soy el usuario root y tengo un nombre de host distinto. Ya no estoy en mi ordenador, estoy dentro del contenedor.

Si ejecuto un comando ls puedo ver los ficheros que hay dentro de este contenedor, por ejemplo.

Realmente puedo hacer lo que quiera.

Así que me voy a buscar la página principal de nginx, la página index, y la voy a toquetear a mi gusto.

Lo primero que he de hacer es instalar un editor de texto n el contenedor, porque no tiene ninguno.

Como este contenedor está basado en Ubuntu puedo usar el comando apt para instalar paquetes, así que voy a instalar el editor nano.

```bash
apt update
apt install nano -y
```

Y ahora voy a editar el fichero index de nginx y a poner el texto que a mí me interesa.

Me he leído la documentación de la imagen de nginx y sé cuál es la ruta de ese fichero.

Al final el secreto de aprender va a ser que hay que leer. Quién lo hubiera dicho…

Lanzo nano con este comando

```bash
nano /usr/share/nginx/html/index.html
```

Una vez dentro, solo voy a modificar el título de la página y cambiarlo por un clásico Hola Mundo.

Hola mundo, soy un servidor nginx

Para grabar el fichero uso CTRL + X y luego confirmo que sí quiero grabar.

Ahora, si voy a mi navegador web y refresco la página, puedo ver que el mensaje ha sido modificado.

No solo eso, sino que, como ya te he dicho, esta modificación en el contenedor se mantiene aunque lo pares.

Te lo voy a mostrar.

Primero he de salir de la shell del contenedor con exit

```bash
exit
```

Una vez fuera voy a parar el contenedor

```bash
docker stop mynginx
```

Yo prefiero asegurarme de que ya no está en ejecución, así que suelo ejecutar docker ps para confirmarlo.

```bash
docker ps
```

Y ahora toca volver a lanzarlo para comprobar que todo sigue funcionando

```bash
docker start mynginx
```

Y al recargar la página web, puedo ver que el mensaje, que antes había modificado, se ha mantenido.

## Las tareas manuales son el mal

Si quisiera podría crear una imagen de este contenedor modificado y distribuirlo.

Pero eso te lo dejo para que lo investigues por tu cuenta.

Aunque te aviso, es una muy mala práctica, ya que pierdes el control de cómo has construido el contenedor, y volver a recrearlo desde cero supone mucho más trabajo y muchas tareas manuales a ejecutar.

Y las tareas manuales son el mal.

Los humanos somos imperfectos y chapuceros y si hay algo que se nos da bien es olvidarnos de hacer tareas importantes y mejor aún se nos da estropearlo todo.

Siempre que puedas, por favor, automatiza todas tus tareas manuales. Es bueno para tu salud mental y es incluso mucho mejor para quien haya de hacerse cargo de tu trabajo después.

[https://www.goodreads.com/author/quotes/60287.John_Woods](https://www.goodreads.com/author/quotes/60287.John_Woods)

Yo en esto suelo seguir el consejo de John Woods.

[https://stackoverflow.com/questions/876089/who-wrote-this-programing-saying-always-code-as-if-the-guy-who-ends-up-maintai](https://stackoverflow.com/questions/876089/who-wrote-this-programing-saying-always-code-as-if-the-guy-who-ends-up-maintai)

Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

## Docker rm

Podría suceder que ya no necesitases un contenedor y quiseras liberar espacio en tu disco duro, pues puedes borrarlo completamente.

Por ejemplo, yo no necesito ya mis contenedores de mysql así que los voy a borrar.

Hay que acordarse de pararlos antes, por supuesto, aunque en este caso ya lo están, así que voy a proceder a eliminarlos.

El comando para borrar contenedores es docker rm y se ha de indicar, como siempre, el nombre del contenedor o su id.

```bash
docker rm mysql8
docker rm mysql5

```

Y si ejecuto docker ps -A, han desaparecido de mi ordenador.

Si ahora quisiera lanzarlos otra vez tendría que volver a usar el comando docker run y especificar de nuevo todas las opciones de configuración que fueran necesarias.

## Docker images

Los contenedores ya no están en mi ordenador, pero las imágenes en las que se basan siguen ahí todavía.

Para listar las imágenes que están presentes en un ordenador se usa el comando docker images.

```bash
docker images
```

En el listado se muestra:

- Lo que se llama repository, que no es más que el nombre de la imagen.
- El tag, o etiqueta, que se sule usar para identificar versiones.
- El Id de la imagen, porque, como los contenedores, todas las imágenes tienen un identificador único.
- La fecha en la que se descargó esa imagen (la columna CREATED).
- Y el tamaño de la imagen.

## Docker rmi

Podría darse el caso de que mi ordenador se llenase de imágenes que ya no uso, y no es cuestión de llenar mi disco duro de basura.

Para borrar una imagen se usa el comando docker rmi (viene a ser algo como docker remove image) y se ha de indicar el nombre de la imagen y su tag separados por dos puntos.

Por ejemplo para borrar la imagen de mysql 8 ejecutaría el comando:

```bash
docker rmi mysql:8
```

Por supuesto si algún contenedor estuviera usando una imagen no podría borrarla. Si intento borrar la imagen de nginx que está en ejecución, no me dejará.

```bash
docker rmi nginx:latest
```

```bash
(base)  linus@mousekin  ~/projects/huggin_face_test  docker rmi nginx:latest
Error response from daemon: conflict: unable to remove repository reference "nginx:latest" (must force) - container d1bb7fc77693 is using its referenced image 30d2ef10a9fc
```

Pero especificando el parámetro - -force ya me deja hacerlo.

```bash
docker rmi nginx:latest --force
```

Si hago un listado de las imágenes, ya no está la imagen de nginx.

```bash
docker images
```

Esa imagen que no tiene nombre y que ves arriba del todo es la que corresponde al contenedor de nginx que se está ejecutando. No la borra, solo la renombra.

Recuerda: un contenedor no es más que una imagen configurada, de ahí que sea necesario conservarla, aunque sea con ese extraño nombre.

Voy a parar el contendor de nginx ya que te voy a hablar sobre cómo limpiar tu ordenador.

```bash
docker stop mynginx
```

## Docker prune

Yo suelo usar de vez en cuando un comando que me ayuda a eliminar elementos de docker que ya no uso, y ese comando es docker system prune

```bash
docker system prune
```

Cuando lo ejecutas te dice qué va a hacer, que básicamente es eliminar basurilla.

```bash
(base)  linus@mousekin  ~/projects/huggin_face_test  docker system prune
WARNING! This will remove:
  - all stopped containers
  - all networks not used by at least one container
  - all dangling images
  - all dangling build cache

Are you sure you want to continue? [y/N]
```

Si quieres eliminar de golpe todas las imágenes de tu ordenador puedes usar el parámetro -a con docker system prune, como estoy haciendo yo ahora.

```bash
docker system prune -a
```

Al volver a hacer un docker images, está todo vacío.

```bash
docker images
```

## Docker pull

También puedo bajarme una imagen sin ejecutarla usando el comando docker pull y especificando el nombre de la imagen y, opcionalmente, su tag.

```bash
docker pull nginx
```

Al volver a listar las imágenes con docker images, ahí está de nuevo.

```bash
docker images
```

## Volúmenes

Los contenedores mantienen dentro de si mismos todas las modificaciones que se van realizando sobre los ficheros que contienen.

Como te mostré hace un momento pude modificar el contenido del fichero index de nginx y cambiar el mensaje que mostraba.

Esto funciona mientras no borres el contenedor, pero una vez borrado, se han perdido las modificaciones.

Pero docker nos provee de una forma de poder almacenar de forma persistente esas modificaciones mediante lo que se llaman volúmenes (o volumes).

Por ejemplo, si se borra el contenedor, podemos seguir manteniendo esa página de inicio y podríamos actualizar la versión de un contenedor pero manteniendo su contenido.

En el caso de una base de datos esto nos permitiría almacenar los datos incluso en otro disco distinto al del ordenador que está ejecutando el contenedor. En otros casos podríamos incluso compartir datos entre contenedores.

Un volumen de docker es un espacio reservado en un disco y que se puede asignar a un contenedor.

No es necesario crear explícitamente ese volumen, aunque existen comandos de docker para hacerlo. No lo voy a explicar en este video de introducción porque es demasiado largo.

Pero sí te voy a contar la forma más sencilla de trabajar con volúmenes que es realizando una operación de mapeo, lo que se conoce como binding, y se basa en indicar a qué directorio o fichero del ordenador host corresponde un ordenador o fichero de un contenedor.

Esto se ve mejor con un ejemplo.

Tengo en mi disco una sencilla página web que voy a usar para sustituir la página web que muestra por defecto el contenedor de nginx.

Es una copia de la wikipedia que me he bajado, por si te interesa, de la página web que te dejo en la descripción del video.

Para mostrar esta página he de lanzar el contenedor mapeando el directorio donde se encuentran los ficheros del servidor web hacia el directorio de mi ordenador donde se encuentran mi página web.

Eso se hace especificando el modificador -v indicando el mapeo, tal que así.

```bash
docker run --name mynginx -v /Users/linus/projects/docker/wikipedia-template:/usr/share/nginx/html:ro -p 80:80 -d nginx
```

Al acceder desde el navegador a [localhost](http://localhost) puedo ver la nueva página web.

Si paro el contenedor y lo borro los ficheros van a seguir ahí.

```bash
docker stop mynginx
docker rm mynginx
```

Si te dedicas a programar en PHP, primero te diré que te compadezco y que espero que en el futuro puedas dedicarte a actividades más edificantes.

Pero lo más impotante es que puedes usar este tipo de mapeo para desarrollar tu aplicación y no necesitas tener instalado un servidor web en tu ordenador.

Y si necesitas una base de datos, porque además haces tus páginas web con wordpress (porque si no era suficiente una desgracia, lo mejor es que sean dos, y grandes), el asunto es que puedes ayudarte lanzando un container de mysql además.

## Crear imágenes

Docker te permite, por supuesto, el crear tus propias imágenes de forma relativamente sencilla.

Para ello hay que enseñarle qué quieres incluir en esa imagen y cómo quieres que funcione.

La definición de cómo se construye una imagen se hace mediante un fichero de texto llamado Dockerfile.

En el repositorio de código de este video, que te dejo en la descripción, dispones de un dockerfile que se encargará de construir una imagen de nginx personalizada.

No me voy a parar demasiado en la sintaxis del dockerfile, solo en las directivas principales.

```dockerfile
FROM nginx:stable-alpine

LABEL "tech.pressanykey"="Press Any Key"
LABEL version="1.0"
LABEL description="Dockerfile example."

RUN apk update
RUN apk --no-cache add unzip wget curl

RUN rm -rf /usr/share/nginx/html/index.html

RUN mkdir /dezip/
WORKDIR /dezip/

RUN curl -LJO https://html5-templates.com/download/wikipedia-template.zip
RUN unzip wikipedia-template.zip

RUN cp -R wikipedia-template/* /usr/share/nginx/html/
```

La directiva principal es **FROM** donde se indica de qué imagen vamos a partir para generar la nueva imagen.

En este caso he partido de una imagen de nginx ya fucnionando, así solo tengo que modificar lo que necesito y no construirla desde cero.

Si estuviese creando una aplicación de Python, por ejemplo, podría haber partido de una de las imagénes de python que ya incluiría todo lo necesario apra ejecutar aplicaciones y estaría conpletamente configurada.

Lo mismo pasa con las imágenes base de Java, de .Net, de Nodejs, y prácticamente de cualquier cosa.

Por supuesto se puede crear una imagen desde cero, pero es más cómodo tener un punto de partida.

Después he incluido unas directivas **LABEL** que se usan para añadir metadatos a la imagen, por ejemplo, quién la ha creado, una descripción, la fecha de creación, etc.

Estos metadatos se pueden ver usando el comando docker inspect sobre la imagen.

La siguiente directiva que he usado es **RUN**, que se utiliza para ejecutar comandos en el contenedor.

Como he partido de una imagen de linux llamada Alpine he podido ejecutar comandos de linux, por ejemplo:

- Con el comando apk he instalado ciertos programas que necesitaba apra construir la imagen.
- He creado un directorio de trabajo
- He usado wget para bajarme un fichero zip que contenía la página web.
- Lo he descomprimido, y he copiado su contenido al directorio de nginx.

Con la directiva **WORKDIR** le he indicado a docker que ese iba a ser mi directoriod e trabajo, básicamente es como ejecutar un comando “cd” en Linux.

Existen otras directivas, como **ADD** y **COPY** que permiten copiar ficheros desde el ordenador que está creando la imagen hacia la imagen.

Otras directivas como **EXPOSE** indican qué puertos de la imagen van a ser expuestos al exterior.

Y las directivas **CMD** y **ENTRYPOINT** indican qué hará el contenedor al arrancar, por ejemplo, lanzar el servidor web.

En el caso de la imagen de la que he partido no he necesitado especificar que ejecutase el servidor nginx, ya que las directivas **CMD** y **ENTRYPOINT** se mantienen mientras no sean modificadas en una imagen derivada.

## Docker build

Una vez que está listo el fichero Dockerfile para construir la imagen se usa el comando docker build de esta forma

```bash
docker build -t wikiexample:latest -platform linux/amd64 .
```

El parámetro -t indica el nombre y la etiqueta que tendrá la imagen, en este caso la voy a llamar wikiexample.

Mi ordenador es un Mac y generaría imágenes que solo podrían ejecutarse en procesadores ARM, asíq ue le añado el parámetro platform, para que cree una imagen compatible con procesadores de tipo Intel o AMD.

Si usas un Linux o windows, este parámetro no es necesario.

El punto al final indica a docker cuál es el directorio donde ha de buscar el fichero Dockerfile. El “punto” en linux significa “directorio actual”, así que va a buscar un fichero llamado Dockerfile en el directorio donde se ejecuta el comando docker build.

Al construir, docker se bajará la imagen base e ira ejecutando los comandos uno a uno hasta generar la imagen final.

Al finalizar puedo consultar la nueva imagen usando el comando docker images

```bash
docker images
```

Y puedo ver que mi imagen wikiexample:latest está en la lista.

Para ejecutarla no tengo más que lanzar el comando docker run que he usado para lanzar nginx

```bash
docker run --name wikiexample -p 80:80 -d wikiexample:latest
```

Y al abrir localhost en el navegador, ahí tengo mi nuevo nginx.

## Docker push

Si quisiera podría distribuir esta imagen y publicarla en un registry server para que otras personas pudieran usarla.

Para esto necesito:

- una cuenta en un registry server, que ya tengo, en docker hub.
- tengo que crear un repositorio en mi cuenta (que ya he hecho anteriormente, como puedes ver aquí)
- y necesito hacer login en esa cuenta, para conectar mi docker local con docker hub.

El login es sencillo, solo se ejecuta el comando docker login y se especifican las credenciales de acceso.

```bash
docker login --username pressanykeytech
```

## Docker tag

Cuando ya tenga acceso me toca reetiquetar la imagen que acabo de crear para que tenga el mismo nombre que el repositorio, tal como te muestro.

```bash
docker tag wikiexample:latest pressanykeytech/wikiexample:latest
```

Si ejecuto docker images habrá aparecido una nueva imagen, aunque realmente es una referencia a la imagen que ya existía.

Después de reetiquetar la imagen ya puedo usar el comando docker push para subir la imagen a mi repositorio:

```bash
docker push pressanykeytech/wikiexample:latest
```

En la web de docker hub puedo ver que ha aparecido una nueva imagen.

Ahora voy a borrar todas las imágenes que he construido de mi ordenador.

```bash
docker system prune -a
docker images
```

Puedes ver que no tengo nada en mi ordenador.

Voy a lanzar el contenedor apr auqe s elo baje desde docker hub:

```bash
docker run --name wiki -p 80:80 -d pressanykeytech/wikiexample:latest
```

Al abrir el navegador de nuevo, tengo disponible mi pagína web.

Y como he definido la imagen como de acceso público, si quieres puede bajártela y probarla en tu ordenador con un docker run:

```bash
docker run --name wiki -p 80:80 -d pressanykeytech/wikiexample:latest
```

## Docker compose intro

Hay una forma muy sencilla de lanzar varios contenedores y que además se comuniquen entre sí, y eso se hace mediante una herramienta llamada Docker Compose.

Docker compose te permite definir en un fichero de texto qué aplicaciones o servicios quieres lanzar, cómo funcionan y cómo se comunican entre sí.

El formato de ese fichero de texto se llama YAML y se tarda un ratito en acostumbrarse a ello, aunque no es complicado.

No es el objetivo de este video el examinar docker compose en detalle, pero sí te voy a mostrar cómo funciona con un ejemplo en el que voy a lanzar:

- un servidor mysql,
- la aplicación phpMyAdmin para poder acceder a la base de datos
- y un servidor web con wordpress.

Dejaré en tus manos el trastear con ello para adaptarlo a tus necesidades.

Antes de nada tengo que parar el contenedor wikiexample, porque voy a publicar wordpress en el mismo puerto. Por si no lo sabías no se pueden compartir puertos en un ordenador.

```bash
docker stop wikiexample
```

## Docker compose YAML

Lo primero que he de hacer es crear un fichero de texto con el nombre docker-compose.yaml.

Realmente el nombre no importa demasiado, pero cuando vayas a ejecutar docker compose lo primero que hará será buscar un fichero con este nombre así que es mejor facilitarle las cosas.

En la descripción del video te indico el repositorio de github donde puedes descargarte todos los ficheros que he usado en este video, y entre ellos el fichero docker-compose que voy a usar.

No tengo intención de teclear a mano todos los comandos y hacerte perder el tiempo así que voy a abrirlo con Visual Studio Code y te muestro las diferentes secciones que tiene y qué significan.

Arriba del todo se indica la versión de docker compose que voy a usar.

Es importante ya que hay comandos que no funcionan en todas las versiones.

Con la versión 3 deberías tener cubiertas la mayor parte de tus necesidades.

```yaml
version: "3"
services:
  db:
    image: mysql
    restart: always
    volumes:
      - ./database:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: admin
      MYSQL_DATABASE: wordpress
      MYSQL_USER: admin
      MYSQL_PASSWORD: admin
    networks:
      - myNetwork
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin
    restart: always
    ports:
      - 8083:80
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: admin
    networks:
      - myNetwork
  wordpress:
    depends_on:
      - db
    image: wordpress
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: admin
      WORDPRESS_DB_PASSWORD: admin
      WORDPRESS_DB_NAME: wordpress
    ports:
      - 80:80
    networks:
      - myNetwork
```

Después se indican los servicios a ejecutar. En mi caso tengo tres servicios:

- db (la base de datos)
- phpmyadmin
- y wordpress.

Dentro de cada servicio se indica la configuración que han de llevar, que tienen su equivalencia con los parámetros de docker equivalentes que usaría para lanzar cada servicio por separado.

Me voy a parar en algunos de ellos porque son importantes:

- **image** indica la imagen del contenedor que se va a usar, como en docker, claro.
- En el caso del servicio de base de datos se usa el parámetro **volumes** para indicar que mapeamos un directorio del contenedor hacia un directorio del ordenador host.
- Mediante **environment** se introducen las variables de configuración que necesita el conteneddor.
  - Parámetros como el nombre de usuario de la base de datos, la password, etcétera. Hay que consultar la documentación de la imagen que quieras usar para saber qué variables de configuración admite.
- En algunos casos se incluyen **ports**, es decir, el mapeo de puertos entre el contenedor y el ordenador HOST. Fíjate que he mapeado wordpress y phpmyadmin pero no mysql, ya que no quiero que la base de datos tenga salida directa hacia el exterior. Es una medida de seguridad bastante habitual el no abrir las bases de datos hacia internet ya que si fuese hackeada los chicos malos tendrían acceso completo al sistema y podrían hacer mucho el mal.
- He incluido un parámetro **network** para que se cree una red virtual para los tres contenedores, así otros contenedores que no formen parte de esa red no podrán acceder a ellos.
- También he incluido un parámetro **restart** para que los contenedores arranquen desde cero siempre, en vez de quedarse en suspenso cuando se paran.
- Y en algunos casos he incluido un parámetro **depends_on** para indicar que que quiero que ciertos contenedores arranquen sólo cuando haya arrancado el contenedor del que dependen.

Más abajo en el fichero docker-compose están definidos el volumen que voy a usar y el nombre de la red.

No es mi objetivo en este video el entrar en profundidad en como funciona docker-compose, pero creo que con esto ya te habrás hecho una idea y podrás investigar por tu cuenta.

## Docker compose up

Para lanzar el servidor se ejecuta el domando docker-compose up.

Has de recordar el poner un -d al final porque si no sucederá como cuando lanzas un contenedor, que tu terminal se quedará conectada a docker y se mostrarán en pantalla los mensajes emitidos por los containers de docker compose.

```bash
cd compose
docker-compose up -d
```

Después de un ratito dispongo de los tres servicios listos para ser usados.

Para acceder a Wordpress solo hay que abrir [localhost](http://localhost) en el navegador

Y ahí tengo la página de configuración donde puedo crear mi usuario principal y hacer todo lo que tenga que hacer con wordpress.

Voy a configurarlo y a dejarlo listo para trabajar.

Y ahí está mi nuevo wordpress.

Para acceder a la base de datos usando phpmyadmin solo he de abrir en el navegador la página [localhost:8083](http://localhost:8083) que es el puerto hacia donde lo he redirigido.

Y ahí está la base de datos a mi disposición.

Puedo ver las tablas que ha creado wordpress y puedo toquetear lo que me apetezca.

Ya has visto que es muy sencillo.

## Docker compose down

Cuando quiera borrar el sistema puedo usar el comando down, que eliminará los contenedores y todo su contenido.

```bash
docker-compose down --volumes
```

La base de datos se conservará porque está mapeada con un directorio del disco duro, pero todas las modificaciones hechas en wordpress se perderán.

Por ejemplo, si instalas plugins o themes, habrán desaparecido ya que todas esas modificaciones se hacen dentro de los contenedores.

La opción - - volumes se usa para que elimine los volúmenes que haya podido crear docker.

Porque sí, aunque uses el binding de docker y mapees los directorios del contenedor hacia directorios de tu disco duro, docker va a crear un volumen “virtual”.

## Docker compose start/stop

Como en el caso de docker run, cuando se ejecuta docker compose up se configura todo el sistema y a partir de ese momento se pueden usar los comandos docker compose start y docker compose stop para arrancar y parar todos los servicios sin que se pierdan las modificaciones efectuadas en los contenedores.

Si te dedicas a crear webs con wordpress, o temas, o plugins (te compadezco, de verdad) podrías incluso mapear el directorio de wordpress hacia tu disco duro y sería mucho más sencillo el obtener los ficheros modificados y utilizarlos en tus proyectos.

Pero eso lo dejo en tus manos. Si te interesa, busca información sobre ello porque es algo tan habitual que hay cientos de páginas web donde explican cómo hacerlo.

Claro que si te interesa mucho mucho, y prefieres que sea yo quien te lo explique, indícamelo en un comentario y quizás me plantee el realizar un video sobre ello.

## Orquestación

Ahora me gustaría comentar algo sobre orquestación de contenedores, porque es el punto donde se unen docker y sistemas como Kubernetes y Openshift, entre otros.

Docker, y docker compose, simplemente sirven para ejecutar contenedores.

Pero qué pasa si necesitas ejecutar el mismo contenedor varias veces, por ejemplo para aprovechar los recursos de un ordenador al completo?

Cada contenedor se ejecuta por separado en su propio proceso y tiene sus propios recursos.

Es mucho más eficiente ejecutar varios contenedores pequeños con un servidor web y la misma aplicación y que vayan tomando y liberando recursos según se necesitan, que el mantener uno solo con muchos recursos (mucha memoria y mucha CPU) y un solo proceso tenga que encargarse de gestionarlo todo.

Me he encontrado muchos casos, de aplicaciones no muy bien diseñadas (y estoy siendo políticamente correcto al decir esto) que se iban degradando a lo largo del tiempo y se volvían más lentas y consumían más memoria cada vez.

Vamos, como cuando dejas un ordenador con Windows encendido durante días, que llega un momento en que casi ni se mueve el ratón.

En esos casos, a esas aplicaciones les viene bien reiniciarse de vez en cuando, o tener tiempo suficiente para liberar memoria, o conexiones de red. Y la mejor forma de hacerlo es repartir la carga de trabajo entre varias de esas aplicaciones para no dejar de dar servicio nunca, pero a la vez poder refrescarse.

También sería maravilloso que hubiese algún sistema que se encargase de comprobar si se produce algún error en un contenedor y actuase en consecuencia, por ejemplo, ejecutando otro para sustituirlo.

O algo que detectase que un contenedor está consumiendo muchos recursos y quizás sería conveniente arrancar otro para ayudarle.

Y si además sería fantástico que se dispusiera de un sistema para balancear la carga de trabajo entre contenedores y que ninguno estuviese sobrecargado.

Pues esos sistemas de vigilancia y control de aplicaciones son los sistemas de Orquestación.

Y entre los más famosos sistemas de orquestación de contenedores están Kubernetes y Openshift.

Docker también dispone de un sistema de orquestación llamado Docker Swarm, pero no ha conseguido tanta fama como, por ejemplo Kubernetes.

## Docker en la nube

Y me queda el último punto para finalizar este video de introducción: dónde puedes publicar tus contenedores más allá de en tu propio ordenador.

La mayoría de los proveedores cloud disponen de algún sistema de publicacion de contenedores. De hecho lo más normal es que sean sistemas extremadamente sencillos de manejar.

AWS dispone de ECS o de App Run.

Google tiene el sistema Cloud Run.

Y Azure dispone de Container Apps.

Esto en cuanto a los tres grandes, pero otros proveedores disponen de sistemas similares.

Yo suelo trabajar también con un proveedor cloud llamado digital Ocean que dispone de un servicio llamado Apps que permite, entre otras cosas, publicar contenedores.

Es tan simple como crear una nueva App, especificar dónde está el código a ejecutar (o bien en un repositorio de código o bien en un Container Registry) y configurarla.

Voy a indicarle a Digital Ocean que mi aplicación está en Github. Tengo que cambiar algunas cosas:

- Para emepezar he de borrar el sitio estático que me quiere crear, ya que ha detectado que existen ficheros html en una carpeta.
- He de cambiar el puerto, ya que mi contenedor usa el puerto 80.
- Y me toca cmabiar la ruta y especificar root, es decir, una barra, así no tendre´q ue especificar un directorio cuando abra mi navegador.

Cuando el proceso está terminado dispongo de un subdominio donde mi aplicación está publicada y mediante el botón Live App puedo acceder a ella.

Con unos pocos clicks he publicado una aplicación en internet.

Si te interesa probar los servicios de Digital Ocean te dejo en la descripción del video un enlace de afiliado donde, si te registras por primera vez, te regalarán 200$ para probar sus servicios, y a mí me regalarán 25 para mantener el tinglado este de Press any Key funcionando.

Gracias.

Creo que por hoy es suficiente información para que puedas comenzar a trastear con docker.

Como regalito, porque me siento generoso, te dejo en la descripción del video el enlace a un fichero PDF con ayuda sobre los comandos más frecuentes de docker y alguna ayuda extra. Puedes imprimirlo y usarlo como chuleta cuando tengas dudas.

Espero que todo lo que te he contado te haya parecido útil y entretenido, y si es así, me harías moderadamente feliz si le das un like al video.

Soy Lino y esto ha sido Press Any Key entre contenedores.

Hasta otra

