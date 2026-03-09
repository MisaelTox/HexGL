# Use the official Nginx Alpine image
FROM nginx:alpine

# Copy game files to the Nginx web root directory
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]