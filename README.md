# pandoc-latex-eclipse-che-dockerfile
Dockerfile para generar libros electrónicos mediante el uso de "make", "LaTeX", "pandoc". Genera EPUB, PDF, HTML.

* Pandoc: pandoc-2.2.1-1
* build-essential: 12.1ubuntu2
* textlive: 2015.20160320-1

Y tomando como base "eclipse/stack-base:ubuntu" que puedes revisar en:

https://github.com/eclipse/che-dockerfiles/blob/master/recipes/stack-base/ubuntu/

Puedes ver un ejemplo de generación de libros en la carpeta "ejemplo":

https://github.com/coresware/pandoc-latex-eclipse-che-dockerfile/tree/master/ejemplo

En pasos generales primero hay que crear la imagen:

```
## docker build -t [nombre-de-la-imagen]:[tag]
docker build -t pandoc-latex-eclipse-che:1.0.0 ./
```

Luego eliminar contenedores de los que ya salieron (Exited Containers):

```
## Docker eliminar "Exited Containers)"
for container in $(docker ps -a | grep "Exited" |awk '{print $1}'); do echo "Eliminando contenedor $container"; docker rm $container; done
```

Luego eliminar imágenes sin etiquetar (Untagged Images):

```
## Docker eliminar "Untagged Images"
for imageId in $(docker images | grep "^<none>" | awk '{print $3}'); do echo "eliminando $imageId"; docker rmi $imageId; done
```

Hacer login al repositorio remoto:

```
export DOCKER_ID_USER="coresware"
docker login
```

Crear un tag:

```
## docker tag [id imagen] [registro]/[nombre imagen]:[tag]
docker tag 5d4fde73dbfc $DOCKER_ID_USER/pandoc-latex-eclipse-che:1.0.0
```
Subir el tag al Docker Hub:

```
## docker push [registro]/[nombre imagen]:[tag]
docker push $DOCKER_ID_USER/pandoc-latex-eclipse-che:1.0.0
```
