#FROM <imagen> especifica la imagen a utilizar como base
FROM node:erbium-alpine

# Config
#Puede extraer el valor de una variable de entorno usando el ENV 
ENV NODE_ENV uat

ENV PORT 3000

# Create app directory
#WORKDIR <ruta> especifica la carpeta de trabajo dentro del contenedor.
WORKDIR /usr/src/app

# COPY  <origen> <destino> copia los ficheros de <origen> en <destino>
COPY ./ /usr/src/app/

# install dependencies
#RUN <comando> ejecuta el comando en el momento de la creación de la imagen
RUN npm install --production

#EXPOSE <puerto> especifica el puerto (o puertos, se pueden indicar varios valores separados por un espacio) que el contenedor habilitará para conexión
EXPOSE 3000
#Added Date command before, so Cloudwatch identify the logs for syncup
#CMD <comando> (requerido) ejecuta el comando en el momento de ejecución del contenedor.
CMD ["sh", "-c", "date ; npm start "]

#byRoxsRoss