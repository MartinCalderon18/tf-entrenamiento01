# Terraform

Terraform es una herramienta para construir, cambiar y versionar infraestructura de manera segura y eficiente. Terraform puede administrar infraestructura en la nube de Azure y tambien soluciones personalizadas.

Los archivos de configuración describen a Terraform los componentes necesarios para ejecutar una sola aplicación o todo su centro de datos. Terraform genera un plan de ejecución que describe lo que hará para alcanzar el estado deseado y luego lo ejecuta para construir la infraestructura descrita. A medida que cambia la configuración, Terraform puede determinar qué cambió y crear planes de ejecución incrementales que se pueden aplicar.

### Como se alinea esto a DevOps?
Las mejores prácticas de DevOps, incluido el control de versiones, las pruebas y el monitoreo continuo, se aplican al código que gobierna la creación y administración de la infraestructura. **Básicamente, la infraestructura es tratada de la misma manera que cualquier otro código.**

Con esto los equipos ahora pueden implementar o actualizar una infraestructura de servidores en cuestión de minutos sin necesidad de instalar nada. Solo se activa el proceso que se ha escrito en el código y las máquinas hacen el trabajo. También es posible retroceder a la última versión estable de la configuración haciendo que las pruebas sean más sencillas.

### Azure Provider

El Azure Provider se puede utilizar para configurar la infraestructura en Microsoft Azure mediante las API de Azure Resource Manager. La documentación sobre las fuentes de datos y los recursos admitidos por el proveedor de Azure se puede encontrar en la navegación de la izquierda.

¿Que puedo administrar? Terraform tiene un registro donde se pueden verificar las distintas funciones y versiones de estas

[Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

### Configuracion vs orquestración

# Instalación de Terraform

## Utilizando Chocolatey
>Nota: Instalar chocolatey siguiendo estas [instrucciones](https://chocolatey.org/install)
1. Abrir una consola de Powershell con permisos elevados y ejecutar el suiguiente comando:
```
choco install terraform
```
## Descargando el binario
 1.  Crear una carpeta para los archivos de instalación de Terraform
 2.  Descargamos el **[Instalador](https://www.terraform.io/downloads.html)**
 3.  Descomprimimos el archivo terraform.exe en la carpeta creada en el paso 1
 4.  En una consola de powershell con privilegios elevados definimos la siguiente variable de entorno:
```
$env:Path += ";C:\temp\terraform"
```
 >Nota: La variable tiene que apuntar a la carpeta creada en el paso 1

# Configurar Terraform usando Azure Cloud Shell

### Azure Cloud Shell
```
1. Abrir la consola de cloud shell
2. Verificar la version de terraform 
   terraform --version
```
### Autenticar utilizando Azure service principal
```
1. Crear un azure service principal
   az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription_id>"

2. Conectarse utilizando la cuenta creada
	az login --service-principal -u <nombre> -p "<password>" --tenant "<tenant>"
	
3. Listar la cuenta para validar
   az account show

Si tuviera multiples subscripciones utilizar el siguiente comando para identificar la correcta:
   az account list --query  "[].{name:name, subscriptionId:id}"
   az account set --subscription="<subscription_id>"
   
```
## Terraform primeros pasos
```
1. Crear un archivo de configuración (Archivo con extension tf ejemplo: crear_vm.tf)
2. Agregar el Azure Provider (Decirle a Terraform que vamos a usar la nube de Azure)
3. Inicializar el archivo (Descargar el proveedor)
4. Revisar el plan (Revisar que va a ser creado/modificado)
5. Aplicar el plan (Crear el recurso)