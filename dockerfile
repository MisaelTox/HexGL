# Usa la imagen oficial de Nginx
FROM nginx:alpine

# Copia el contenido del juego a la carpeta que sirve Nginx
# Asumiendo que los archivos del juego están en la raíz o una carpeta /code
COPY . /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]