FROM nginx:alpine

# Copy your custom Nginx configuration (the one that proxies /api to the backend)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the frontend HTML file
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (default HTTP port)
EXPOSE 80

# Nginx will start automatically (base image CMD)
