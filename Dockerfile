FROM nginx:alpine

# Install envsubst for variable substitution
RUN apk add --no-cache gettext

# Copy nginx config template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Copy frontend files
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (Nginx listens on port 80 inside container)
# The external port will be mapped via -p HOST_PORT:80
EXPOSE 80

# Nginx will automatically substitute variables from environment
CMD ["nginx", "-g", "daemon off;"]