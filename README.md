# devops-junior-program-aws-1

## APLICACION IMPLEMENTADA
### La solución implementada es un Hello World sencillo basado en Java que muestra un pequeño mensaje simple.
#
## TECNOLOGÍAS EMPLEADAS
### Para la integración del sistema se han combinado las siguientes tecnologías:
### -Terraform: Para la construcción y lanzamiento del proyecto. Ha sido la principal herramienta que más hemos utilizado y a partir de la cual se ha desarrollado todo el proyecto.
### -Git: esencial para las ramas y el control de versiones. En varias ocasiones nos vimos obligados a retroceder o crear una rama para hacer prueabas concretas y añadir funcionalidades.
### -Jenkins: necesario para el pipeline e integración continua. Lo combinamos dentro de eks para la gestión de los pods.
### Kubernetes / eks: Orquestrador principal encargado de coordinar los nodos y comunicarlos adecuadamente.
### Docker: trabaja conjuntamnete a kubernetes.
### Maven / curl: empleado para el buildeo y testeo de la aplicación.
#

## FUNCIONES DE AWS EMPLEADAS
### -EC2
### -IAM
### -Security Group
### -VPC
### -Pilas / Stacks
#

### PROBLEMAS ENCONTRADOS EN EL DESARROLLO
## -La caducidad de crecenciales de AWS nos obligaba a estar constantemente reintroduciendo las claves para realizar los terraform plan
## -Docker in docker: tuvimos numerosos problemas y quebraderos de cabeza para lanzar Jenkins dentro de kubernetes/docker
## -