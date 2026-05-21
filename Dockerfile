FROM nginx:alpine

# Copy your HTML file
COPY index.html /usr/share/nginx/html/

# Copy the nginx configuration TEMPLATE to the correct location
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Expose port 80
EXPOSE 80

# Nginx will now automatically use the template and substitute env vars
CMD ["nginx", "-g", "daemon off;"]