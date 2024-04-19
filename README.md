# Node.js Rest APIs with Express & MySQL example

## Project setup
```
npm install
```

### Run
```
node server.js
```

# informe de deploy 
Se crea con ayuda de terrafom un app service q aloje nuestraaplicacion de node
ademas de utilizar un container instance en el q corre nuestra base de datos en mysql

Usando github actions hacemos 2 procesos 
- creamos y desplegamos una imagen de la base de datos mysql para la aplicacion 
- se realiza la ajecuion de terraform para crear la infraestructura nececsaria para nuestra aplicacion 