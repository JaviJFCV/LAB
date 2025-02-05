Test de Ingeniero DevOps - Bice Vida

Prueba de código 

	Objetivo: Implementar un pipeline para despliegue de una aplicación en una Cloud pública (AWS, Google o
Azure)


- Se creó app en node.js/Express que consume el endpoint https://dn8mlk7hdujby.cloudfront.net/interview/insurance/58 y expone una API REST.
El código Node.js es el archivo index.js que se encuentra en el repositorio https://github.com/JaviJFCV/LAB/blob/main/index.js


- Para esta actividad, se implementó infraestructura como código (BICEP) del recurso Azure App Service para el despliegue de la app.
El codigo de despliegue de App Service se encuentra aquí: https://github.com/JaviJFCV/LAB/blob/main/appservice.bicep 

- Se extrajeron los accesos de Azure y se cargaron en la configuración de Secrets de GitHub https://github.com/JaviJFCV/LAB/settings/secrets/actions

- Se configuró el pipeline de CI/CD con GitHub Actions.Se creo el código deploy.yml con 2 stage:

Build: Instalación de dependencias y creación del paquete de la aplicación.
	- Steps:Checkout repository --> extraer el código fuente del repositorio de GitHub, permite que la acción de CI/CD tenga acceso al código del repositorio para realizar las tareas que se indican en los steps siguientes
		Set up Node.js --> se la versión de Node.js que se utiliza
		Install dependencies -->  instala las dependencias necesarias para el proyecto Node.js (package.json)

Deploy: Sube el paquete a Azure App Service
	- Steps:Checkout repository --> extraer el código fuente del repositorio de GitHub, permite que la acción de CI/CD tenga acceso al código del repositorio para realizar las tareas que se indican en los steps siguientes
		Login to Azure --> se ingresa a Azure con las credenciales almacenadas en Github con el nombre AZURE_CREDENTIALS
		Deploy to Azure App Service --> realiza el despliegue en el recurso Azure App Service "lab-devops-webapp-linux".
			Logout from Azure --> se desconecta de Azure.
		
El pipeline se encuentra aqui: https://github.com/JaviJFCV/LAB/blob/main/.github/workflows/deploy.yml


- Se valida el correcto llamado al endpoint con la aplicacion desplegada en Azure en la URL: https://lab-devops-webapp-linux.azurewebsites.net/insurance

Repositorio GitHub: https://github.com/JaviJFCV/LAB

